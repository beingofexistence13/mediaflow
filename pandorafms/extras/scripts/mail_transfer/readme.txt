Pandora Mail Transfer
======================

1st Edition , 3 May 2011

(c) Pandora FMS 2005-2023
(c) Juan Manuel Ramon <juanma@artica.es>
(c) Javier Lanz <javier.lanz@artica.es>

Description
-----------

Pandora Mail Transfer is a tool for sending and receiving xml files via email.
This script sends through a SMTP server, to the desired address, an email with an attached file.
Is able as well to fetch via POP3 that mail and its attached file.
It's designed to be used with an specific email account, so every time the script is called in “receive” mode, all emails on that account will be deleted. Do not use this script in a personal account because all your emails will be deleted.

This script is designed to send only text files, no binary files.

It's only possible to send .data, .txt, or .xml files.

Requisites
----------

In order to be able to use this application, it's a must having the following Perl's CPAN packages installed in your system:

 Mail::POP3Client
 MIME::Parser
 Authen::SASL
 Net::SMTP;

To install these libraries with CPAN, for example Mail::POP3Client:

    cpan install Mail::POP3Client

To use the program under Windows, you will need to compile with a compiler like ActiveState PERL. The ActiveState environment allows as well to install CPAN modules easily.

Previous the script execution, it's a must having a configuration file, in which the mail server connection parameters will be defined.

Below it's shown a configuration file example, in which the necessary fields for the proper use of the mail transfer script are detailed.

Sample configuration file 
-------------------------

########################################### 
### SMTP DATA 
###########################################

smtp_user username@domain.com 
smtp_pass pass 
smtp_hostname mailserver.domain.com 
########################################### 
### POP3 DATA 
########################################### 
pop3_user username@domain.com 
pop3_pass pass 
pop3_hostname mailserver.domain.com 
# Enable or disable SSL. 1 means Enabled , 0 Disabled
pop3_ssl 0 
# SSL port 
pop3_ssl_port 995 
########################################### 
### TO SEND INFO 
########################################### 
# Email receiver where to send the email 
receiver_email desired.mail@domain.com 
########################################### 
### PATH TO SAVE THE ATTACHED FILE 
########################################### 
# Desired path where the attached file will be stored 
pathtosave /path/to/save/attached


Pandora mail transfer execution
-------------------------------

The proper way of executing the script should be according to...

    ./mail_transfer <action> <conf_file> [file_to_send]

Where the meaning of the fields are:

<action> could be 'send' or 'receive'

<conf_file> configuration file, explained above, contains every necessary data for sending and receiving emails.

[file_to_send] desired xml file to send (Only necessary in case of action = 'send')

Execution examples:

    ./mail_transfer send config_file.conf textfile.txt

    ./mail_transfer receive config_file.conf

Restrictions
------------

SSL Protocol

In this first version, SSL protocol is only implemented for the mail reception, not for sending.
Another related SSL Protocol restriction is the email erasing once read and downloaded to disk. In case of using SSL, deleting is not possible, on the other hand, if it's not used, the read mail will be properly deleted from the server once download to disk.

Attached file

There is a wee bug not fixed yet about the attached file name. If this one contains special characters such as '(' ')' '\' and more, while downloading from the server, it will be saved to disk with a different file name, probably wrong, although its content will be the right one. Thus, it's recommended not to use special characters in the file name.

