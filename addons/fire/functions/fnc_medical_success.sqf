#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Makes object catch fire. Only call from events
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
_intensity = _intensity * (4/5);
_patient setVariable [QGVAR(intensity), _intensity, true];
