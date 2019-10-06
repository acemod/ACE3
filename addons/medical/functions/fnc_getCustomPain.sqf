#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Gets pain from external components or mods on a unit.
 *
 * Arguments:
 * 0: Unit (needs to be local) <OBJECT>
 * 1: Pain index (default: 0) <NUMBER>
 *
 * Return Value:
 * Pain amount <NUMBER>
 *
 * Example:
 * private _pain = [player, mod_painIdx] call ace_medical_fnc_getCustomPain;
 *
 * Public: Yes
 */
params [
    ["_unit", objNull, [objNull]],
    ["_index", 0, [0]]
];

if (!local _unit) exitWith {
    ERROR_1("Unit [%1] is not local",_unit);
};

[_unit, _index] call EFUNC(medical_vitals,getCustomPain);
