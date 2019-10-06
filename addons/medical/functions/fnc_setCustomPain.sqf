#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Sets pain from external components or mods on a unit.
 *
 * This function allows you to define your own mod's pain source, which you can
 * manually increase and decrease later. If you want to be Zeus compatible,
 * make sure to save the returned index on the unit itself, as it might not be
 * the same for every unit.
 *
 * Arguments:
 * 0: Unit (needs to be local) <OBJECT>
 * 1: Pain amount (range: 0..1) <NUMBER>
 * 2: Pain index, -1 to assign new index (default: 0) <NUMBER>
 * 3: Enable pain decay (default: true) <BOOL>
 *
 * Return Value:
 * Pain index <NUMBER>
 *
 * Example:
 * // Pain source that can be manually decreased later, e.g. an open wound
 * mod_painIdx = [player, 0.5, [mod_painIdx] param [0, -1]] call ace_medical_fnc_setCustomPain;
 * // Heal custom pain source, e.g. treat an open wound
 * mod_painIdx = [player, 0, [mod_painIdx] param [0, -1]] call ace_medical_fnc_setCustomPain;
 * // Permanent pain source that does not decay, e.g. a broken heart
 * mod_painIdx = [player, 1, [mod_painIdx] param [0, -1], false] call ace_medical_fnc_addCustomPain;
 *
 * Public: Yes
 */
params [
    ["_unit", objNull, [objNull]],
    ["_pain", 0, [0]],
    ["_index", 0, [0]],
    ["_enableDecay", true, [false]]
];

if (!local _unit) exitWith {
    ERROR_1("Unit [%1] is not local",_unit);
};

[_unit, _pain, _index, _enableDecay] call EFUNC(medical_vitals,setCustomPain);
