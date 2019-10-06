#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Sets pain from external components or mods on a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Pain amount (range: 0..1) <NUMBER>
 * 2: Pain index, -1 to assign new index (default: 0) <NUMBER>
 * 3: Enable pain decay (default: true) <BOOL>
 *
 * Return Value:
 * Pain index <NUMBER>
 *
 * Example:
 * mod_painIdx = [player, 0.5, [mod_painIdx] param [0, -1]] call ace_medical_vitals_fnc_setCustomPain;
 *
 * Public: No
 */
params ["_unit", "_pain", ["_index", 0], ["_enableDecay", true]];

private _customPain = _unit getVariable [QGVAR(customPain), [0]];

_pain = 0 max _pain min 1;

if (_index == -1) then {
    _index = count _customPain;
};

if (!_enableDecay) then {
    _pain = -_pain;
};

_customPain set [_index, _pain];
_unit setVariable [QGVAR(customPain), _customPain];

_index
