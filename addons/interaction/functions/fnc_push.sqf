/*
 * Author: KoffeinFlummi
 * Pushes a boat away from the player
 *
 * Arguments:
 * 0: Boat <OBJECT>
 * 1: Player <OBJECT>
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

params ["_boat", "_player"];

private ["_newVelocity"];

_newVelocity = [2 * (vectorDir _player select 0), 2 * (vectorDir _player select 1), 0.5];

[QGVAR(pushBoat), [_boat], [_boat, _newVelocity]] call EFUNC(common,targetEvent);
