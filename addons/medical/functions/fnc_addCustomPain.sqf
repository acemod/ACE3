#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Adds pain from external components or mods on a unit.
 *
 * Custom pain will never decrease when calling this function, the maximum of
 * the current and the parameter value will be used. Use setCustomPain in
 * combination with getCustomPain to decrease custom pain instead. This
 * function is intended for pain events, like pain from bumping your head.
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
 * // One time light pain event (without an index, can be changed by other mods), e.g. bumping your head
 * [player, 0.3] call ace_medical_fnc_addCustomPain;
 * // Pain source that can be manually decreased later, e.g. an open wound
 * mod_painIdx = [player, 0.5, [mod_painIdx] param [0, -1]] call ace_medical_fnc_addCustomPain;
 * // Permanent pain source that does not decay, e.g. a broken heart
 * mod_painIdx = [player, 1, [mod_painIdx] param [0, -1], false] call ace_medical_fnc_addCustomPain;
 *
 * Public: Yes
 */
params ["_unit", "_addedPain", "_index", "_enableDecay"];

private _oldPain = [_unit, _index] call FUNC(getCustomPain);
private _newPain = 0 max (_oldPain max _addedPain) min 1;

[_unit, _newPain, _index, _enableDecay] call FUNC(setCustomPain);
