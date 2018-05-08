/*
 * Author: Ruthberg
 * Get the perceived pain level of a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Pain level (0 .. 1) <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _pain = GET_PAIN_TOTAL(_unit);
private _painSuppress = _unit getVariable [QGVAR(painSuppress), 0];

(0 max (_pain - _painSuppress) min 1)
