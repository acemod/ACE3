/*
 * Author: KoffeinFlummi
 * Pushes a boat away from the player
 *
 * Arguments:
 * 0: Boat <OBJECT>
 * 1: Velocity <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, [vector]] call ace_interaction_fnc_push
 *
 * Public: No
 */
 
#include "script_component.hpp"

PARAMS_2(_boat,_velocity);

if !(local _boat) exitWith {
    [_this, QFUNC(push), _boat] call EFUNC(common,execRemoteFnc);
};

_boat setVelocity _velocity;
