#include "..\script_component.hpp"
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
 * [player, 1] call ace_tacticalladder_fnc_cancelTLdeploy
 *
 * Public: No
 */

#define __ANIMS ["extract_1","extract_2","extract_3","extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]

params ["_unit", "_key"];

if (_key != 1 || {isNull GVAR(ladder)}) exitWith {};

// enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

detach GVAR(ladder);

GVAR(ladder) animate ["rotate", 0];

{
    GVAR(ladder) animate [_x, 0];
} forEach __ANIMS; //Don't "optimize" this to a count. See #6607

// remove mouse buttons and hint
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Deploy), -1]] call EFUNC(Common,removeActionEventHandler);

GVAR(ladder) = objNull;
