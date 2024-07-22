#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2
 * Forces a civilian to the ground with a chance of failure.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [civillian] call ace_interaction_fnc_getDown
 *
 * Public: No
 */

#define SEND_RADIUS 10

params ["_unit", "_target"];

[_unit, "GestureGo"] call EFUNC(common,doGesture);

private _chance = [0.5, 0.8] select (weapons _unit isNotEqualTo []);

{
    if (weapons _x isEqualTo [] && {random 1 < _chance}) then {
        [QGVAR(getDown), [_x], [_x]] call CBA_fnc_targetEvent;
    };
} forEach (_target nearEntities ["Civilian", SEND_RADIUS]);
