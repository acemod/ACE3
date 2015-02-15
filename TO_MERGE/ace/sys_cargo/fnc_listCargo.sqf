/*
Function: ACE_fnc_listCargo

Description:
	Lists cargo of a vehicle.

Parameters:
	_vehicle - Vehicle to load cargo into. (Must exist) [Object]
Returns:
	Array

Example:
	(begin example)
		["MyTruck"] call ACE_fnc_listCargo;
	(end)

Author:
	rocko
*/

#include "script_component.hpp"

PARAMS_1(_vehicle);

_currentcargo = _vehicle getVariable [QGVAR(content), []];
TRACE_1("",_currentcargo);
_currentcargo
