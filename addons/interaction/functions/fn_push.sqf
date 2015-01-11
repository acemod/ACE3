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

_boat = _this select 0;
_velocity = _this select 1;

if !(local _boat) exitWith {
  [_this, "AGM_Interaction_fnc_push", _boat] call AGM_Core_fnc_execRemoteFnc;
};

_boat setVelocity _velocity;
