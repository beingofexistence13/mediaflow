/* Test module to prove FTP connection.

   Copyright (c) 2006-2023 Pandora FMS.
   Written by Esteban Sanchez.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License along
   with this program; if not, write to the Free Software Foundation,
   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/

#include "pandora_ftp_test.h"
#include "../misc/pandora_file.h"
#include <iostream>
#include <dir.h>
#include <dirent.h>

using namespace std;
using namespace FTP;
using namespace Pandora;

/**
 * Creates a Pandora_FTP_Test object.
 *
 * It will read the configuration file and prepares
 * all the information to perform a FTP test.
 */
Pandora_FTP_Test::Pandora_FTP_Test () {
	string conf_file;
	
	conf_file = Pandora::getPandoraInstallDir ();
	conf_file += "pandora_agent.conf";
	conf = Pandora::Pandora_Agent_Conf::getInstance ();
	conf->setFile (conf_file);
	
	ftp_client = new FTP::Pandora_Ftp_Client ();
}

/**
 * Deletes a Pandora_FTP_Test object.
 */
Pandora_FTP_Test::~Pandora_FTP_Test () {
	delete conf;
	delete ftp_client;
}

/**
 * Executes a FTP test.
 *
 * It will generate a lot of output to the stdout.
 *
 * @exception Authentication_Failed Throwed if the authentication process
 *            failed when connecting to the host.
 * @exception Socket_Error Throwed when something goes bad with the sockets.
 * @exception Resolv_Failed Throwed when the remote host could not be resolved
 *            to a valid IP.
 * @exception Connection_Failed Throwed if the TCP/IP connection to the host
 *            failed or could not be done. It includes timeouts, route failures,
 *            etc
 * @exception Session_Error Throwed if there was problem with the FTP session.
 * @exception Pandora::Pandora_Exception Throwed if there was an unespecified
 *            error.
 */
void
Pandora_FTP_Test::test () {
	string            data_xml;
	string            password, tmp_filename;
	string            remote_host, remote_filepath, tmp_filepath;
	bool              saved;
	char             *err;
	DIR              *dir;
	FILE             *conf_fh = NULL;
	int		  timeout;

	remote_host = this->conf->getValue ("server_ip");
	cout << "Connecting with " << remote_host << "..." << endl;
	password = this->conf->getValue ("server_pwd");
	timeout = atoi (conf->getValue ("transfer_timeout").c_str ());
	if (timeout == 0) {
		timeout = 30;
	}
	
	if (password == "") {
		cout << "FTP password not found in configuration file." << endl;
		cout << "Check that server_pwd variable is set." << endl;
		return;
	}
	cout << "Username: pandora" << endl;
	
	ftp_client = new FTP::Pandora_Ftp_Client ();
	ftp_client->connect (remote_host,
			     22,
			     "pandora",
			     password);
	
	dir = opendir (conf->getValue ("temporal").c_str ());
	if (dir == NULL) {
		cout << "Error when opening temporal directory." << endl;
		cout << "Check that \"" << conf->getValue ("temporal")
		     << "\" exists" << endl;
		delete ftp_client;
		
		return;
	}
	closedir (dir);
	
	tmp_filename = "ftp.test";
	tmp_filepath = conf->getValue ("temporal");
	if (tmp_filepath[tmp_filepath.length () - 1] != '\\') {
		tmp_filepath += "\\";
	}
	tmp_filepath += tmp_filename;
	
	data_xml = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\" ?>\n";
	conf_fh = fopen (tmp_filepath.c_str (), "w");
	if (conf_fh == NULL) {
		Pandora::Pandora_Exception e;
		cout << "Error when saving the XML in " << tmp_filepath << endl;
		cout << "Check the configuration file" << endl;
		throw e;
	}
	fprintf (conf_fh, "%s", data_xml.c_str ());
	fclose (conf_fh);

	cout << "Created a blank XML file in " << tmp_filepath<< endl;
	
	remote_filepath = conf->getValue ("server_path");
	if (remote_filepath[remote_filepath.length () - 1] != '/') {
		remote_filepath += "/";
	}
	cout << "Remote copying " << tmp_filepath << "on server " << remote_host
	     <<  " at " << remote_filepath << tmp_filename << endl;

	try {
		ftp_client->ftpFileFilename (remote_filepath + tmp_filename,
					     tmp_filepath, timeout);
	} catch (FTP::Unknown_Host e) {
		cout << "Failed when copying to " << remote_host << " (" <<
			ftp_client->getError () << ")" << endl;
		delete ftp_client;
		
		throw e;
	} catch (FTP::Authentication_Failed e) {
		cout << "Authentication Failed when connecting to " << remote_host << " ("
		     << ftp_client->getError () << ")" << endl;
		delete ftp_client;
		
		throw e;
	} catch (FTP::FTP_Exception e) {
		cout << "Failed when copying to " << remote_host <<
			" (" << ftp_client->getError ()<< ")" << endl;
		delete ftp_client;
		
		throw e;
	}

	cout << "Successfuly file copied to remote host " << endl;
	ftp_client->disconnect ();
	delete ftp_client;
	
	cout << "Successfuly disconnected from remote host " << endl;
	
	try {
		Pandora_File::removeFile (tmp_filepath);
	} catch (Pandora_File::Delete_Error e) {
	}
	
	cout << "The FTP test was successful!" << endl;
}
