/*
 * Author: BaerMitUmlaut
 * Get the heart rate of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Heart Rate <NUMBER>
 */
#include "script_component.hpp"
params ["_unit"];

_unit getVariable [QGVAR(heartRate), DEFAULT_HEART_RATE]
