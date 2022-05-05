#include "script_component.hpp"
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

params ["_player"];

if (!isNil {_player getVariable QGVAR(sittingStatus)}) then {
    _player call FUNC(stand);
};
