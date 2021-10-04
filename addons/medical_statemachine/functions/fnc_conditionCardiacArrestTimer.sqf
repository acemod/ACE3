#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the cardiac arrest timer ran out.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_conditionCardiacArrestTimer
 *
 * Public: No
 */

params ["_unit"];

(_unit getVariable [QGVAR(cardiacArrestTimeLeft), -1]) <= 0
