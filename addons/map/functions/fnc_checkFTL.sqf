#include "..\script_component.hpp"
/*
* Author: Dextro
* Check if can Become FTL for Fire Team
*
* Arguments:
* 1: Unit <OBJECT>
*
* Return Value:
* Able to become FTL <BOOL>
*
* Example:
* [player] call ace_map_fnc_checkFTL
*
*/

// Parameter Init
params ["_unit"];

// Check Condition
if (!((_unit getVariable ["ACE_FTL",""]) in ["RED","BLUE","YELLOW","GREEN"]) && (assignedTeam _unit in ["RED","BLUE","YELLOW","GREEN"]) && (leader _unit  != _unit) && !([_unit] call FUNC(isSergeant))) exitWith {
	true
};

// Default Return
false