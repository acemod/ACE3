#include "script_component.hpp"
/*
 * Author: GhostIsSpooky, based on ace_medical_treatment_fnc_getHealTime
 * Calculates the Full Repair time based on the amount of damage to repair
 *
 * Arguments:
 * 0: Engineer (not used) <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Repair Time <NUMBER>
 *
 * Example:
 * [player] call ace_repair_fnc_getFullRepairTime
 *
 * Public: No
 */

params ["", "_vehicle"];

#define MISC_REPAIR_TIME 15

private _vehicleDamage = 0;

{
    _vehicleDamage = _vehicleDamage + _x;
} forEach (getAllHitPointsDamage _vehicle select 2);

30 max (((_vehicleDamage * MISC_REPAIR_TIME) min 180) * GVAR(fullRepairTimeCoef))
