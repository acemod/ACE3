/*
 * Author: BaerMitUmlaut
 * Sets the heart rate of a unit.
 *
 * Arguments:
 * 0: The Unit   <OBJECT>
 * 1: Heart rate <NUMBER>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_unit", "_heartRate"];

_unit setVariable [QGVAR(heartRate), _heartRate];
