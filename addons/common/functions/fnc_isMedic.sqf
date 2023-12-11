#include "..\script_component.hpp"
/*
 * Author: kymckay
 * Check if a unit is a medic
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * Unit is medic <BOOL>
 *
 * Example:
 * [player] call ace_common_fnc_isMedic
 *
 * Public: Yes
 */

params ["_unit"];

private _isMedic = _unit getVariable [QEGVAR(medical,medicClass), getNumber (configOf _unit >> "attendant")];

_isMedic > 0
