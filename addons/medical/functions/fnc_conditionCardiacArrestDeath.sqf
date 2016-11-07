/*
 * Author: BaerMitUmlaut
 * Handles a unit entering cardiac arrest.
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

private _startTime = _unit getVariable [QGVAR(cardiacArrestStart), CBA_missionTime];

(CBA_missionTime - _startTime) > (GVAR(maximumCardiacArrestTime) * 60)
