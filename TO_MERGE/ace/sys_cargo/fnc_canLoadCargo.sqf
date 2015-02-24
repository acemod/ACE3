/*
Function: ACE_fnc_canLoadCargo

Description:
	Checks if vehicle is able to load cargo

Parameters:
	_vehicle - Vehicle to load cargo into. [Object]
Returns:
	true if _vehicle is able to load cargo, otherwise false.

Example:
	(begin example)
		_result = [myTruck] call ACE_fnc_canLoadCargo;
	(end)

Author:
	Xeno
*/

#include "script_component.hpp"

PARAMS_1(_vehicle);

if (isNil "_vehicle" || {isNull _vehicle}) exitWith {false};

(getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_canBeLoad") == 1)