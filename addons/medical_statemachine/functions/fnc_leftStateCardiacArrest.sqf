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

_unit setVariable [QGVAR(inCardiacArrest), false, true];
_unit setVariable [QGVAR(cardiacArrestStart), nil];
SET_HEART_RATE(_unit,40);
_unit setVariable [QGVAR(lastTimeUpdated), CBA_missionTime];
