/*
 * Author: Glowbal
 * Check if unit has CMS enabled
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * enabled <BOOL>
 *
 * Example:
 * [Unit] call ace_medical_fnc_hasMedicalEnabled
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _medicalEnabled = _unit getVariable QGVAR(enableMedical);
if (isNil "_medicalEnabled") exitWith {
    (((GVAR(enableFor) == 0 && (isPlayer _unit || (_unit getVariable [QEGVAR(common,isDeadPlayer), false])))) || (GVAR(enableFor) == 1) || GVAR(level) == 1)
};

_medicalEnabled
