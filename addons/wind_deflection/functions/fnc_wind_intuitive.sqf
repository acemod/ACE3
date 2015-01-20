/* fnc_wind_intuitive.sqf | (c) 2009 by rocko */

// [5,4] spawn ace_sys_wind_deflection_fnc_wind_intuitive

#include "script_component.hpp"

#define __dsp (uiNamespace getVariable "ACE_RscWindIntuitive")
#define __ctrl (__dsp displayCtrl 1591514)

#define __path "\x\ace\addons\sys_wind_deflection\data\"

private["_ar","_str","_str_tmp"];
PARAMS_2(_ar_number,_str_number);

// Using Beaufort scale values - assuming wind in ACE is done m/s - otherwise fuck it and make better :)
_nowind = false;
if (_str_number >= 0 && {_str_number < 0.3}) then { _str = [1,1,1,0.5], _nowind = true; }; 	//Calm / probably never happens in arma (even vanilla has always light wind)
if (_str_number >= 0.3 && {_str_number < 2}) then { _str = [1,1,1,0.5]};					//Light air - white
if (_str_number >= 2 && {_str_number < 3}) then { _str = [0.56,0.93,0.56,0.5]}; 			//Light breeze - light green
if (_str_number >= 3 && {_str_number < 5}) then { _str = [0.53,1,0.18,0.5]}; 				//Gentle breeze - green yellow 
if (_str_number >= 5 && {_str_number < 8}) then { _str = [1,1,0,0.5]}; 						//Moderate breeze - yellow 
if (_str_number >= 8 && {_str_number < 11}) then { _str = [0.85,0.65,0.1,0.5]}; 			//Fresh breeze - dark yellow 
if (_str_number >= 11 && {_str_number < 14}) then { _str = [1,0.65,0,0.5]}; 				//Strong breeze - orange
if (_str_number >= 14 && {_str_number < 17}) then { _str = [0.93,0.25,0,0.5]}; 				//High wind,moderate gale, near gale - red orange				
if (_str_number >= 17) then { _str = [1,0,0,0.5]};											//Gale,fresh gale - red

_ar = if (!_nowind) then { format[__path+"wind"+"%1"+".paa", _ar_number] } else { __path+"wind0.paa" };

__ctrl ctrlSetText _ar;
__ctrl ctrlSetTextColor _str;
