#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the PAK treatment time based on the amount of damage to heal.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * Treatment Time <NUMBER>
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_getHealTime
 *
 * Public: No
 */

#define DAMAGE_SCALING_FACTOR 5

params ["", "_patient"];

private _bodyPartDamage = 0;

{
    _bodyPartDamage = _bodyPartDamage + _x;
} forEach (_patient getVariable [QEGVAR(medical,bodyPartDamage), []]);

10 max (((_bodyPartDamage * DAMAGE_SCALING_FACTOR) min 180) * GVAR(timeCoefficientPAK))
