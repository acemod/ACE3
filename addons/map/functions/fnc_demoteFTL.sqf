#include "..\script_component.hpp"
/*
* Author: Dextro
* Become FTL for Fire Team
*
* Arguments:
* 1: Unit <OBJECT>
*
* Return Value:
* None
*
* Example:
* [player] call ace_map_fnc_demoteFTL
*
*/

// Parameter Init
params ["_unit"];

// Remove FTL
_unit setVariable ["ACE_FTL","",true];
_unit setUnitRank "PRIVATE";

_str = "You are not FTL anymore"; 
[_str] call EFUNC(common,displayTextStructured);
