/*
 * Author: Rocko, Ruthberg, commy2
 * Cancel tactical ladder deployment
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: ladder <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ladder] call ace_tacticalladder_fnc_cancelTLdeploy
 *
 * Public: No
 */
#include "script_component.hpp"

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

params ["_unit", "_ladder"];

// enable running again
[_unit, "ACE_Ladder", false] call EFUNC(common,setForceWalkStatus);

detach _ladder;

_ladder animate ["rotate", 0];

{
    _ladder animate [_x, 0];
} count __ANIMS;

// remove mouse buttons and hint
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);
[_unit, "zoomtemp",      _unit getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);

GVAR(ladder) = objNull;
