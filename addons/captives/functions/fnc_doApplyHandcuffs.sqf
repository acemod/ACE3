#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Checks the conditions for being able to apply handcuffs
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_doApplyHandcuffs;
 *
 * Public: No
 */


params ["_unit", "_target"];

playSound3D [QUOTE(PATHTO_R(sounds\cable_tie_zipping.ogg)), objNull, false, (getPosASL _target), 1, 1, 10];

[QGVAR(setHandcuffed), [_target, true, _unit], [_target]] call CBA_fnc_targetEvent;

private _cuffs = (_unit call EFUNC(common,uniqueItems)) arrayIntersect GVAR(restraints);

_unit removeItem (_cuffs#0);
