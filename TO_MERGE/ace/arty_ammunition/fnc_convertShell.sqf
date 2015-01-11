// #define DEBUG_MODE_FULL
#include "script_component.hpp"

_unit = _this;

{
	if (isText(configFile >> "CfgMagazines" >> _x >> "ACE_ARTY_SHELL_VEHICLE")) then {
		_convertTo = getText(configFile >> "CfgMagazines" >> _x >> "ACE_ARTY_SHELL_VEHICLE");
		_unit removeMagazine _x;
		_shell = _convertTo createVehicle (getpos _unit);
		_shell setPos [(getPos _unit select 0) + random 0.75,(getPos _unit select 1) + random 0.75,getPos _unit select 2];
		if (isArray(configFile >> "CfgVehicles" >> _convertTo >> "ACE_ARTY_SHELL_PREP")) then {
			_prep = getArray(configFile >> "CfgVehicles" >> _convertTo >> "ACE_ARTY_SHELL_PREP");
			_prep set [2,abs(random 10000)];
			_shell setVariable ["ACE_ARTY_PREP",_prep,true];
			_shell call FUNC(AddModelIncrements);
		};
	};
} foreach magazines _unit;