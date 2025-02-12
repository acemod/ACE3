#include "..\script_component.hpp"
/*
* Author: Dextro
* Checks if a unit is platoon medic
*
* Arguments:
* 1: Unit <OBJECT>
*
* Return Value:
* is Platoon Medic <BOOL>
*
* Example:
* [player] call ace_map_fnc_findPlatoonMedic
*
*/

// Parameter Init
params ["_unit"];
private _return = false;

// Check Condition
if (_unit getVariable ["SR_Class","R"] isEqualTo "PM" && _unit getVariable ["ace_medical_medicClass",0] == 2) then {
	_return = true;
};

// Return
_return