#include "script_component.hpp"
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

#define SEND_DISTANCE 50
#define SEND_RADIUS 10

params ["_unit"];

[_unit, "GestureGo"] call EFUNC(common,doGesture);

private _chance = [0.5, 0.8] select (count weapons _unit > 0);

{
    if (count weapons _x == 0 && {random 1 < _chance}) then {
        private _position = getPosASL _unit vectorAdd (eyeDirection _unit vectorMultiply SEND_DISTANCE);
        _position set [2, 0];

        [QGVAR(sendAway), [_x, _position], [_x]] call CBA_fnc_targetEvent;
    };
    false
} count (_unit nearEntities ["Civilian", SEND_RADIUS]);
