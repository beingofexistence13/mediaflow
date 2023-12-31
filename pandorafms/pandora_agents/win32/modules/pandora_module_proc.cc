/* Pandora proc module. These modules check if a program is alive in the system.

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

#include "pandora_module_proc.h"
#include "pandora_module_list.h"
#include "../windows/pandora_wmi.h"
#include "../windows/pandora_windows_info.h"
#include "../pandora_strutils.h"
#include "../pandora_windows_service.h"
#include <algorithm>
#include <cctype>

using namespace Pandora;
using namespace Pandora_Modules;
using namespace Pandora_Strutils;
using namespace Pandora_Windows_Info;

/** 
 * Creates a Pandora_Module_Proc object.
 * 
 * @param name Module name.
 * @param process_name Process name to check.
 */
Pandora_Module_Proc::Pandora_Module_Proc (string name, string process_name)
	: Pandora_Module (name) {
	
	this->process_name = process_name;
	transform (process_name.begin (), process_name.end (),
		   this->process_name.begin (), (int (*) (int)) tolower);
	
	this->setKind (module_proc_str);
	
	this->watchdog = false;
	this->user_session = false;
	this->start_command = "";
	this->retries = 3;
	this->start_delay = 5000;
	this->retry_delay = 2000;
	this->thread = 0;
}
/** 
 * Destroys a Pandora_Module_Service object.
 */
Pandora_Module_Proc::~Pandora_Module_Proc () {

	// Close the thread if module is async
	if (this->thread) {
		TerminateThread(this->thread, 0);
	}
}

string
Pandora_Module_Proc::getProcessName () const {
	return this->process_name;
}

bool
Pandora_Module_Proc::isWatchdog () const {
	return this->watchdog;
}

string
Pandora_Module_Proc::getStartCommand () const {
	return this->start_command;
}

int
Pandora_Module_Proc::getRetries () const {
	return this->retries;
}

int
Pandora_Module_Proc::getStartDelay () const {
	return this->start_delay;
}

int
Pandora_Module_Proc::getRetryDelay () const {
	return this->retry_delay;
}

bool
Pandora_Module_Proc::getUserSession () const {
	return this->user_session;
}

void
Pandora_Module_Proc::setWatchdog (bool watchdog) {
	this->watchdog = watchdog;
}

void
Pandora_Module_Proc::setStartCommand (string command) {
	this->start_command = command;
}

void
Pandora_Module_Proc::setRetries (int retries) {
	if (retries < 1) {
		return;
	}
	this->retries = retries;
}

void
Pandora_Module_Proc::setStartDelay (int mseconds) {
	if (mseconds < 0) {
		return;
	}

	this->start_delay = mseconds;
}

void
Pandora_Module_Proc::setRetryDelay (int mseconds) {
	if (mseconds < 0) {
		return;
	}

	this->retry_delay = mseconds;
}

void
Pandora_Module_Proc::setUserSession (bool usession) {
	this->user_session = usession;
}

void
async_run (Pandora_Module_Proc *module) {
	HANDLE              *processes = NULL;
	int                  nprocess;
	DWORD                result;
	Pandora_Module_List *modules;
	string               str_res;
	string               prev_res;
	int                  i, res, counter = 0, num_proc;
	
	prev_res = module->getLatestOutput ();
	modules = new Pandora_Module_List ();
	modules->addModule (module);
	Sleep (module->getStartDelay ());

	while (1) {
		processes = getProcessHandles (module->getProcessName (), &num_proc);
		if (processes == NULL) {
			if (module->isWatchdog ()) {
				if (counter >= module->getRetries ()) {
					module->setWatchdog (false);
					continue;
				}

                Sleep (module->getRetryDelay ());
				Pandora_Wmi::runProgram (module->getStartCommand (), NULL, module->getUserSession());
                Sleep (module->getStartDelay ());
				counter++;
				continue;
			}

			Sleep (2000);
			continue;
		}
		
		/* Reset retries counter */
		counter = 0;

		/* There are opened processes */
		res = Pandora_Wmi::isProcessRunning (module->getProcessName ());
		str_res = inttostr (res);
		if (str_res != prev_res) {
			module->setOutput (str_res);
			prev_res = str_res;
			Pandora_Windows_Service::getInstance ()->sendXml (modules);
		}
		
		/* Wait for this processes */
		nprocess = res;
		result = WaitForMultipleObjects (nprocess, processes, FALSE, 10000);
		
		if (result > (WAIT_OBJECT_0 + nprocess - 1)) {
			/* No event happened */
			for (i = 0; i < num_proc; i++)
				CloseHandle (processes[i]);
			pandoraFree (processes);
			continue;
		}
		
		/* Some event happened, probably the process was closed */
		res = Pandora_Wmi::isProcessRunning (module->getProcessName ());
		str_res = inttostr (res);
		if (str_res != prev_res) {
			module->setOutput (str_res);
			prev_res = str_res;
			Pandora_Windows_Service::getInstance ()->sendXml (modules);
		}
		
		/* Free handles */
		for (i = 0; i < num_proc; i++)
			CloseHandle (processes[i]);
		pandoraFree (processes);
	}
	
	delete modules;
}

void
Pandora_Module_Proc::run () {
	int res;
	
	try {
		Pandora_Module::run ();
	} catch (Interval_Not_Fulfilled e) {
		return;
	}
	
	res = Pandora_Wmi::isProcessRunning (this->process_name);
	this->setOutput (inttostr (res));
	
	/* Launch thread if it's asynchronous */
	if (this->async) {
		this->thread = CreateThread (NULL, 0,
					     (LPTHREAD_START_ROUTINE) async_run,
					     this, 0, NULL);
		this->async = false;
	}
}
