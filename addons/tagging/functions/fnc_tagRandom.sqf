/*
 * Author: Jonpas
 * Selects random tag and applies it.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_tagging_fnc_tagRandom
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

private _possibleTags = GVAR(cachedTags) select {(_x select 2) in ((items _unit) apply {toLower _x})};

[_unit, selectRandom ((selectRandom _possibleTags) select 3)] call FUNC(tag);
