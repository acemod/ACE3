#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Pushes a boat away from the player
 *
 * Arguments:
 * 0: Boat <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_interaction_fnc_push
 *
 * Public: No
 */

params ["_boat", "_unit"];

private _newVelocity = vectorDir _unit;
_newVelocity set [2, 0.25];
_newVelocity = _newVelocity vectorMultiply 2;

[QEGVAR(common,setVelocity), [_boat, _newVelocity], _boat] call CBA_fnc_targetEvent;
