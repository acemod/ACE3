/*
 * Author: BaerMitUmlaut
 * Get the total pain level of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Pain level (0 .. 1) <NUMBER>
 */
#include "script_component.hpp"
params ["_unit"];

_unit getVariable [QGVAR(pain), 0]
