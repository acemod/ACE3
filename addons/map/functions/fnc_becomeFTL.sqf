#include "..\script_component.hpp"
/*
* Author: Dextro
* Become FTL for Fire Team
*
* Arguments:
* 1: Unit <OBJECT>
* 2: FireTeam <STRING>
*
* Return Value:
* None
*
* Example:
* [player,"RED"] call ace_map_fnc_becomeFTL
*
*/

// Parameter Init
params ["_unit","_fireTeam"];

// Remote Fire Team Leader Status if another one already exists
{
	if (_x getVariable ["ACE_FTL",""] isEqualTo _fireTeam) then {
		_x setVariable ["ACE_FTL","",true];
		_x setUnitRank "PRIVATE";
	};
}forEach (units group _unit);

// Set FTL
_unit setVariable ["ACE_FTL",_fireTeam,true];
_unit setUnitRank "CORPORAL";
_unit assignTeam _fireTeam;

_str = "You are FTL - " + _fireTeam; 
 [_str] call EFUNC(common,displayTextStructured);