/*
 * Author: Ruthberg, Arcanum
 * Calculates the personal aid kit treatment time based on amount of damage to heal
 *
 * Arguments:
 * unit <OBJECT>
 *
 * Return Value:
 * treatment time <NUMBER>
 *
 * Example:
 * [_target] call ace_medical_treatment_fnc_HealTimeMedkit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _totalDamage = 0;
private _treattTime = 0;

{
    _totalDamage = _totalDamage + _x;
} forEach (_unit getVariable [QEGVAR(medical,bodyPartDamage), []]);
if (EGVAR(medical,MedkitTime) > 0) then {
    _treatTime = EGVAR(medical,MedkitTime);
} else {
    _treatTime = 10 max (_totalDamage * 5) min 180;
};
_treatTime
