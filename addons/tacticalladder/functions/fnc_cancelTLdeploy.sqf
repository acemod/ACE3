/*
 * Author: Rocko, Ruthberg, commy2
 * Cancel tactical ladder deployment
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Key <NUMBER>
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

params ["_unit", "_key"];

if (_key != 1 || {isNull GVAR(ladder)}) exitWith {};

// enable running again
[_unit, "forceWalk", "ACE_Ladder", false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", "ACE_Ladder", false] call EFUNC(common,statusEffect_set);

detach GVAR(ladder);

GVAR(ladder) animate ["rotate", 0];

{
    GVAR(ladder) animate [_x, 0];
    true
} count __ANIMS;

// remove mouse buttons and hint
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);

GVAR(ladder) = objNull;
