/*
 * Author: KoffeinFlummi, commy2
 * Sends a near civilian crowd away with a chance of failure.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [civillian] call ace_interaction_fnc_sendAway
 *
 * Public: No
 */
#include "script_component.hpp"

#define SEND_DISTANCE 50
#define SEND_RADIUS 10

params ["_unit"];

_unit playActionNow "GestureGo";

private "_chance";
_chance = [0.5, 0.8] select (count weapons _unit > 0);

{
    if (count weapons _x == 0 && {random 1 < _chance}) then {
        private "_position";
        _position = getPosASL _unit vectorAdd (eyeDirection _unit vectorMultiply SEND_DISTANCE);
        _position set [2, 0];

        ["sendAway", [_x], [_x, _position]] call EFUNC(common,targetEvent);
    };
    false
} count (_unit nearEntities ["Civilian", SEND_RADIUS]);
