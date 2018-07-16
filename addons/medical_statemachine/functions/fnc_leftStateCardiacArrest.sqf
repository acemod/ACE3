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

_unit setVariable [VAR_CRDC_ARRST, false, true];
_unit setVariable [QEGVAR(medical,cardiacArrestStart), nil];
_unit setVariable [VAR_HEART_RATE, 40, true];
_unit setVariable [QGVAR(lastTimeUpdated), CBA_missionTime];
