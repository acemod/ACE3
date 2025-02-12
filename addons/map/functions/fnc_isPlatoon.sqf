#include "..\script_component.hpp"
/*
* Author: Dextro
* Checks if a group is platoon element
*
* Arguments:
* 1: Group <OBJECT>
*
* Return Value:
* is Platoon <BOOL>
*
* Example:
* [_group] call ace_map_fnc_isPlatoon
*
*/

// Parameter Init
params ["_group"];
private _return = false;

// Check Condition
if ((groupId _group) in ["PL","PL-1","PL-2"]) then {
	_return = true;
};

// Return
_return