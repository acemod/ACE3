/*
 * Author: Jonpas
 * Handles interruptions of sitting, like killed or unconsciousness.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_sitting_fnc_handleInterrupt;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_player);

if (_player getVariable [QGVAR(isSitting), false]) then {
    _player setVariable [QGVAR(isSitting), nil];
    GVAR(seat) setVariable [QGVAR(seatOccupied), nil, true];
    QGVAR(seat) = nil;
};
