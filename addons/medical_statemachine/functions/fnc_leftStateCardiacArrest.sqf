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
_unit setVariable [QGVAR(heartRate), 40, true];
_unit setVariable [QGVAR(lastTimeUpdated), CBA_missionTime];
