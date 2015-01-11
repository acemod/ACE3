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

_boat = _this select 0;
_velocity = _this select 1;

if !(local _boat) exitWith {
  [_this, QUOTE(FUNC(push)), _boat] call EFUNC(core,execRemoteFnc);
};

_boat setVelocity _velocity;
