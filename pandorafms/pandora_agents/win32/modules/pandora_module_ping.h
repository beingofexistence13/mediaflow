/* Pandora ping module. These modules ping a command

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

#ifndef	__PANDORA_MODULE_PING_H__
#define	__PANDORA_MODULE_PING_H__

#include "pandora_module_exec.h"

namespace Pandora_Modules {
	/**
	 * Module to ping a host.
	 */
	class Pandora_Module_Ping : public Pandora_Module_Exec {
	public:
		Pandora_Module_Ping    (string name, string host, string count, string timeout, string advanced_options);
	};
}

#endif
