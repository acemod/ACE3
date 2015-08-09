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
 * player call ace_sitting_fnc_handleInterrupt
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

if (_player getVariable [QGVAR(isSitting), false]) then {
    _player call FUNC(stand);
};
