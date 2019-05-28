#include "script_component.hpp"
/*
 * Author: mharis001
 * Calculates the Surgical Kit treatment time based on the amount of bandaged wounds.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_getStitchTime
 *
 * Public: No
 */

#define TIME_PER_WOUND 5

params ["", "_patient"];

count (_patient getVariable [QEGVAR(medical,bandagedWounds), []]) * TIME_PER_WOUND
