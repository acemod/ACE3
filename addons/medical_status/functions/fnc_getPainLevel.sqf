/*
 * Author: Ruthberg
 * Get the total pain level of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * Pain level (0 .. 1) <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _pain = _unit getVariable [QGVAR(pain), 0];
private _painSuppress = _unit getVariable [QGVAR(painSuppress), 0];

(0 max (_pain - _painSuppress) min 1)
