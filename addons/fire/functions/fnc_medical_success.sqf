#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Decreases burning intensity on successful medical action.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_fire_fnc_medical_success
 *
 * Public: No
 */

params ["_medic", "_patient"];

private _intensity = _patient getVariable [QGVAR(intensity), 0];
_intensity = _intensity * INTENSITY_DECREASE_MULT_PAT_DOWN;
_patient setVariable [QGVAR(intensity), _intensity, true];
