#include "script_component.hpp"
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

// Exit if Quick Tag disabled
if (GVAR(quickTag) == 0) exitWith {};

params ["_unit"];

private _possibleTags = [];
private _useRandom = false;

// Last Used
if (GVAR(quickTag) == 1) then {
    private _lastUsedTagClass = _unit getVariable [QGVAR(lastUsedTag), nil];

    if (isNil "_lastUsedTagClass") then {
        _useRandom = true;
    } else {
        private _lastUsedTag = GVAR(cachedTags) select {(_x select 0) == _lastUsedTagClass};
        _possibleTags = _lastUsedTag;
    };
};

// Random X
if ((GVAR(quickTag) == 2) || _useRandom) then {
    private _xTags = GVAR(cachedTags) select {(_x select 0) in ["ACE_XBlack", "ACE_XRed", "ACE_XGreen", "ACE_XBlue"]};
    _possibleTags = _xTags;
};

// Random
if (GVAR(quickTag) == 3) then {
    _possibleTags = GVAR(cachedTags);
};

// Tag
if !(_possibleTags isEqualTo []) then {
    private _availableTags = _possibleTags select {(_x select 2) in (_unit call EFUNC(common,uniqueItems))};
    (selectRandom _availableTags) params ["", "", "", "_textures", "", "_materials"];

    (
        if (count _textures == count _materials) then {
            private _textureIndex = floor random count _textures;
            [_textures select _textureIndex, _materials select _textureIndex]
        } else {
            [selectRandom _textures, selectRandom _materials]
        }
    ) params ["_randomTexture", "_randomMaterial"];

    [_unit, _randomTexture, _randomMaterial] call FUNC(tag);
};
