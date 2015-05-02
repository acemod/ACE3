/*
 * Author: KoffeinFlummi
 *
 * Pushes a boat away from the player.
 *
 * Arguments:
 * 0: Boat (object)
 * 1: Velocity (vectorlike array)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_boat,_velocity);

if !(local _boat) exitWith {
  [_this, QUOTE(FUNC(push)), _boat] call EFUNC(common,execRemoteFnc);
};

_boat setVelocity _velocity;
