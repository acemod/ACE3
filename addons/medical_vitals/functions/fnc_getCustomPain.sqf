#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Gets pain from external components or mods on a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Pain index (default: 0) <NUMBER>
 *
 * Return Value:
 * Pain amount <NUMBER>
 *
 * Example:
 * private _pain = [player, mod_painIdx] call ace_medical_vitals_fnc_getCustomPain;
 *
 * Public: No
 */
params ["_unit", ["_index", 0]];

private _customPain = _unit getVariable [QGVAR(customPain), []];

// Absolute value for non decaying pain, which is saved as a negative value
abs (_customPain param [_index, 0])
