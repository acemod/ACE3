#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Gives the unit a second chance and prevents death for 1 second.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_transitionSecondChance
 *
 * Public: No
 */

params ["_unit"];

_unit setVariable [QEGVAR(medical,deathBlocked), true];
[{
    _this setVariable [QEGVAR(medical,deathBlocked), false];
}, _unit, 1] call CBA_fnc_waitAndExecute;
