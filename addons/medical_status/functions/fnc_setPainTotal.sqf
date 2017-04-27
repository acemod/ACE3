/*
 * Author: BaerMitUmlaut
 * Sets the total pain level of a unit.
 *
 * Arguments:
 * 0: The Unit          <OBJECT>
 * 1: Pain level (0..1) <NUMBER>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_unit", "_pain"];

_unit setVariable [QGVAR(pain), 0 max _pain min 1];
