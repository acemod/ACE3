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
 * [player] call ace_tagging_fnc_quickTag
 *
 * Public: No
 */

#include "script_component.hpp"

// Exit if Quick Tag disabled
if (GVAR(quickTag) == 0) exitWith {};

params ["_unit"];

private _possibleTags = [];

// Last Used
if (GVAR(quickTag) == 1) then {
    private _lastUsedTagClass = _unit getVariable [QGVAR(lastUsedTag), nil];

    if (!isNil "_lastUsedTagClass") then {
        private _lastUsedTag = GVAR(cachedTags) select {(_x select 0) == _lastUsedTagClass};
        _possibleTags = _lastUsedTag;
    };
};

// Random X
if (GVAR(quickTag == 2)) then {
    private _xTags = GVAR(cachedTags) select {(_x select 0) in ["ACE_XBlack", "ACE_XRed", "ACE_XGreen", "ACE_XBlue"]};
    _possibleTags = _xTags;
};

// Random
if (GVAR(quickTag) == 3) then {
    _possibleTags = GVAR(cachedTags);
};

// Tag
if !(_possibleTags isEqualTo []) then {
    private _availableTags = _possibleTags select {(_x select 2) in ((items _unit) apply {toLower _x})};
    [_unit, selectRandom ((selectRandom _availableTags) select 3)] call FUNC(tag);
};
