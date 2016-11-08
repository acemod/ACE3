/*
 * Author: BaerMitUmlaut
 * Prevents instant death for 1 second.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit"];

_unit setVariable [QGVAR(deathBlocked), true];
[{
    _this setVariable [QGVAR(deathBlocked), false];
}, _unit, 1] call CBA_fnc_waitAndExecute;
