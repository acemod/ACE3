#include "script_component.hpp"
/*
 * Author: RedBery
 * Handles a unit leaving cardiac arrest (calls for a status update).
 * Clears countdown timer variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_leftStateCardiacArrest
 *
 * Public: No
 */

params ["_unit"];

_unit setVariable [QGVAR(cardiacArrestTime), nil];
_unit setVariable [QEGVAR(medical,cardiacArrestStart), nil];

// Vitals loop is halted during cardiac arrest, so this resets the time tracking for it
_unit setVariable [QEGVAR(medical_vitals,lastTimeUpdated), CBA_missionTime];

[_unit, false] call EFUNC(medical_status,setCardiacArrest);
