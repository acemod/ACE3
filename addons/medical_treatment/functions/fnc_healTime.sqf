#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the personal aid kit treatment time based on amount of damage to heal
 *
 * Arguments:
 * unit <OBJECT>
 *
 * Return Value:
 * treatment time <NUMBER>
 *
 * Example:
 * [_target] call ace_medical_treatment_fnc_healTime
 *
 * Public: No
 */

params ["_unit"];

private _totalDamage = 0;
private _treatTime = 0;

{
    _totalDamage = _totalDamage + _x;
} forEach (_unit getVariable [QEGVAR(medical,bodyPartDamage), []]);

if (EGVAR(medical,PAKTime) > 0) then {
    _treatTime = EGVAR(medical,PAKTime);
} else {
    _treatTime = 10 max (_totalDamage * 5) min 180;
};
_treatTime
