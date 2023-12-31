/* Misc utils for strings.
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

#include "pandora.h"
#include "pandora_strutils.h"
#include <string.h>
#include <iostream>
#include <sstream>
#include <stdexcept>
#include <cstring>    // for strchr
#include <vector>
#include <iterator>

using namespace Pandora;

/** 
 * Removes heading and tailing blank spaces from a string.
 *
 * The blank spaces removed are " ", "\t", "\r" and "\n".
 * 
 * @param str String to be trimmed.
 * 
 * @return The trimmed string.
 */
string
Pandora_Strutils::trim (const string str) {
	const char *      delims = " \t\r\n";
	string            result = str;
	string::size_type index = result.find_last_not_of (delims);
	
	if (index != string::npos) {
		result.erase (++index);
	}
	
	index = result.find_first_not_of (delims);
	if (index != std::string::npos) {
		result.erase (0, index);
	} else {
		result.erase ();
	}
	
	return result;
}

/** 
 * Encode the given string to base64.
 * Based on: https://en.wikibooks.org/wiki/Algorithm_Implementation/Miscellaneous/Base64
 *
 * @param str String to be encoded.
 * 
 * @return The base64 encoded string.
 */
string
Pandora_Strutils::base64Encode(string str) {
	string base64_str;
	std::uint32_t temp;
	const static char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

	std::vector<std::uint8_t> buffer(begin(str), end(str));
	base64_str.reserve(((buffer.size() / 3) + (buffer.size() % 3 > 0)) * 4);

	std::vector<std::uint8_t>::iterator cursor = buffer.begin();
	for(size_t idx = 0; idx < buffer.size() / 3; idx++) {
		temp  = (*cursor++) << 16;
		temp += (*cursor++) << 8;
		temp += (*cursor++);
		base64_str.append(1, alphabet[(temp & 0x00FC0000) >> 18]);
		base64_str.append(1, alphabet[(temp & 0x0003F000) >> 12]);
		base64_str.append(1, alphabet[(temp & 0x00000FC0) >>  6]);
		base64_str.append(1, alphabet[(temp & 0x0000003F)]);
	}

	switch(buffer.size() % 3){
		case 1:
			temp  = (*cursor++) << 16;
			base64_str.append(1, alphabet[(temp & 0x00FC0000) >> 18]);
			base64_str.append(1, alphabet[(temp & 0x0003F000) >> 12]);
			base64_str.append(2, '=');
			break;
		case 2:
			temp  = (*cursor++) << 16;
			temp += (*cursor++) << 8;
			base64_str.append(1, alphabet[(temp & 0x00FC0000) >> 18]);
			base64_str.append(1, alphabet[(temp & 0x0003F000) >> 12]);
			base64_str.append(1, alphabet[(temp & 0x00000FC0) >>  6]);
			base64_str.append(1, '=');
			break;
		}

	return base64_str;
}

/** 
 * Convert an unicode string to a ANSI string.
 * 
 * @param s String to convert
 * 
 * @return String converted into ANSI code
 */
string
Pandora_Strutils::strUnicodeToAnsi (LPCWSTR s) {
	string output;
	
	if (s == NULL)
		return NULL;
	
	int cw = lstrlenW (s);
	if (cw == 0) {
		return output;
	}

	int cc = WideCharToMultiByte (CP_ACP,0, s, cw, NULL, 0, NULL, NULL);
	if (cc==0) {
		return output;
	}

	CHAR *psz = new CHAR[cc+1];
	cc = WideCharToMultiByte (CP_ACP, 0, s, cw, psz, cc, NULL, NULL);
	if (cc == 0) {
		delete[] psz;
		return output;
	}
	psz[cc]='\0';
	output = psz;
	delete[] psz;

	return output;
}


/** 
 * Convert an ANSI string to a unicode string. Do not forget to
 * delete the returned string!
 * 
 * @param s String to convert
 * 
 * @return String converted to Unicode
 */
wstring
Pandora_Strutils::strAnsiToUnicode (LPCSTR s) {
	LPWSTR output;
	wstring w_output;
	
	int lenW = MultiByteToWideChar(CP_ACP, 0, s, -1, NULL, 0);
	if (lenW <= 0) {
		return NULL;
	}
	output = new wchar_t[lenW];
	MultiByteToWideChar(CP_ACP, 0, s, -1, output, lenW);
	
	w_output = output;
	delete[] output;
	
	return w_output;
}

/** 
 * Transform an integer variable into a string.
 * 
 * @param i Integer to transform.
 * 
 * @return A string with the integer value.
 */
string
Pandora_Strutils::inttostr (const int i) {
	return longtostr (i);
}

/** 
 * Transform a long variable into a string.
 * 
 * @param i Long variable to transform
 * 
 * @return A string with the long value.
 */
string
Pandora_Strutils::longtostr (const long i) {
	std::ostringstream o;
	
	o << i;
	
	return o.str();
}

/** 
 * Transform a long variable into hexadecimal.
 * 
 * @param i Long variable to transform.
 * 
 * @return The hexadecimal value of the long variable.
 */
string
Pandora_Strutils::longtohex (const long i) {
	std::ostringstream o;
	o << std::hex << i;
	
	return o.str();
}

/** 
 * Tranform a string into a integer.
 * 
 * @param str String to convert.
 * 
 * @return The integer value of the string.
 *
 * @exception Invalid_Conversion throwed if the string has non-
 *            decimal values.
 */
int
Pandora_Strutils::strtoint (const string str) {
	int result;
	
	if (! std::sscanf (str.c_str (), "%d", &result)) {
		throw Invalid_Conversion ();
	}
	return result;
}

/** 
 * Returns the double precision floating-point value of a given string.
 * 
 * @param str The string.
 * 
 * @return The double precision floating-point value of the string.
 *
 * @exception Invalid_Conversion thrown on error.
 */
double
Pandora_Strutils::strtodouble (const string str) {
	double result;
	
	if (! std::sscanf (str.c_str (), "%le", &result)) {
		throw Invalid_Conversion ();
	}
	return result;
}

/** 
 * Tranform a string into a long integer.
 * 
 * @param str String to convert.
 * 
 * @return The long integer value of the string.
 *
 * @exception Invalid_Conversion throwed if the string has non-
 *            decimal values.
 */
unsigned long long
Pandora_Strutils::strtoulong (const string str) {
	unsigned long long result;

	if (! std::sscanf (str.c_str (), "%I64d", &result)) {
		throw Invalid_Conversion ();
	}

	return result;
}

/** 
 * Replace every occurence of a pattern in a string with other substring.
 * 
 * @param in Objective string.
 * @param pattern Pattern to be replaced.
 * @param rep Substring that replace every occurence of the pattern.
 * 
 * @return The input string with all pattern occurence replaced.
 */
string
Pandora_Strutils::strreplace (string in, string pattern, string rep) {
	int i = in.find (pattern);
	int j;
	
	if (i < 0) {
		return in;
	}
	
	int plen = pattern.length ();
	int rlen = rep.length ();
	
	do {
		in.replace(i, plen, rep);
		i += rlen;
		string rest = in.substr (i, in.length () - i);
		j = rest.find (pattern);
		i += j;
	} while (j >= 0);
	
	return in;
}

inline bool
isseparator (char c, char const * const wstr) {
	return (strchr (wstr, c) != NULL);
}

/** 
 * Split a string into diferent tokens, divided by one or many
 * field separators.
 * 
 * @param l Returned string list with every tokens. Must be initialized
 *        before calling the function.
 * @param s Input string.
 * @param separators Field separators string. I.e. " \t" will separate
 *        with every " " and "\t". Can be ommited and will be " \t\n".
 */
void
Pandora_Strutils::stringtok (list<string> &l, string const &s, 
		     char const * const separators) {
    
	const string::size_type  strsize = s.size();
	string::size_type        i = 0;
	
	while (i < strsize) {
		/* eat leading whitespace */
		while ((i < strsize) && (isseparator (s[i], separators))) {
			i++;
		}
		if (i == strsize) {
			return;  /* nothing left but WS */
		}
		
		/* find end of word */
		string::size_type  j = i + 1;
		while ((j < strsize) && (!isseparator (s[j], separators))) {
			j++;
		}
		
		/* add word */
		l.push_back (s.substr (i, j - i));
		
		/* set up for next loop */
		i = j + 1;
	}
}
