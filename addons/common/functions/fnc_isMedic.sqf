#include "..\script_component.hpp"
/*
 * Author: kymckay, DartRuffian
 * Check if a unit is a medic
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Medic level <NUMBER> (default: 1)
 *    - Only relevant if ace_medical is loaded
 *
 * Return Value:
 * Unit is medic <BOOL>
 *
 * Example:
 * [player] call ace_common_fnc_isMedic
 *
 * Public: Yes
 */

params ["_unit", ["_medicN", 1]];

private _isMedic = _unit getVariable [QEGVAR(medical,medicClass), getNumber (configOf _unit >> "attendant")];

_isMedic >= _medicN
