/* Pandora service module. These modules check if a service is running in the
   system.

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

#ifndef	__PANDORA_MODULE_SERVICE_H__
#define	__PANDORA_MODULE_SERVICE_H__

#include "pandora_module.h"
#include "pandora_module_list.h"

namespace Pandora_Modules {
	/**
	 * Module to check that a windows service is running on the
	 * system.
	 */
	class Pandora_Module_Service : public Pandora_Module {
	private:
		string service_name;
		HANDLE thread;
		bool   watchdog;
	public:
		Pandora_Module_Service (string name, string service_name);
		~Pandora_Module_Service ();
		
		void   run             ();
		string getServiceName  () const;
		bool   isWatchdog      () const;
		void   execute_async_service (string &prev_res, Pandora_Module_Service *module, Pandora_Module_List *modules);
		
		void   setWatchdog     (bool watchdog);
	};
}

#endif
