/*
 * Author: BaerMitUmlaut
 * Check if the unit is unconscious.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Is unconscious <BOOL>
 */
#include "script_component.hpp"
params ["_unit"];

_unit getVariable [QGVAR(isUnconscious), false]
