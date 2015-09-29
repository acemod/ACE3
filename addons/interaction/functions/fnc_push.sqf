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
 * [Boats, Jose] call ace_interaction_fnc_push
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_boat", "_unit"];

private "_newVelocity";
_newVelocity = vectorDir _unit;
_newVelocity set [2, 0.25];
_newVelocity = _newVelocity vectorMultiply 2;

["setVelocity", [_boat], [_boat, _newVelocity]] call EFUNC(common,targetEvent);
