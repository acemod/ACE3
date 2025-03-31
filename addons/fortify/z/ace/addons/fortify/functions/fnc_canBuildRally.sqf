#include "script_component.hpp"
/*
 * Author: Kingsley
 * Checks whether the given player can build a rally point.
 *
 * Arguments:
 * 0: Player <OBJECT>
*
 * Return Value:
 * Can Build Rally <BOOL>
 *
 * Example:
 * [player] call ace_fortify_fnc_canBuildRally
 *
 * Public: Yes
 */

// Parameter Init
params ["_unit"];
private _return = false;
private _group = groupid group _unit;
private _leader = leader _unit;
private _rank = rank _unit;
private _platoon = ["P","P-1","P-2","PL"];

// Check if PL / PSGT / P with Tools 
if (_rank isEqualTo "SERGEANT" && _group in _platoon) then {_return = true;};
if (_leader == _unit && _group in _platoon) then {_return = true;};
if ({_x in (items _unit)} count ["ACE_ConstructionTool","ACE_EntrenchingTool"] > 0 && _group in _platoon) then {_return = true;};

// Return
_return
