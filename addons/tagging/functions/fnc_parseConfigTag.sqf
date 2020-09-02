#include "script_component.hpp"
/*
 * Author: Jonpas, Dedmen
 * Parses tags from ACE_Tags config.
 *
 * Arguments:
 * 0: The config class <CONFIG>
 * 1: Is Mission <BOOL>
 *
 * Return Value:
 * Tag Information <ARRAY>
 *
 * Example:
 * [_x, false] call ace_tagging_fnc_parseConfigTag
 *
 * Public: No
 */

#define GET_MOD_OR_MISSION_PATH(thing)    \
    if (thing select [0,1] != "@") then { \
        getMissionPath thing;             \
    } else {                              \
        thing select [1];                 \
    }

params ["_cfg", ["_isMission", false, [false]]];


private _failure = false;
private _class = configName _cfg;

private _displayName = getText (_cfg >> "displayName");
if (_displayName == "") then {
    ERROR_1("Failed compiling ACE_Tags for tag: %1 - missing displayName",_class);
    _failure = true;
};

private _requiredItem = getText (_cfg >> "requiredItem");
if (_requiredItem == "") then {
    ERROR_1("Failed compiling ACE_Tags for tag: %1 - missing requiredItem",_class);
    _failure = true;
} else {
    if (!isClass (configFile >> "CfgWeapons" >> _requiredItem)) then {
        ERROR_2("Failed compiling ACE_Tags for tag: %1 - requiredItem %2 does not exist",_class,_requiredItem);
        _failure = true;
    } else {
        _requiredItem = configName (configFile >> "CfgWeapons" >> _requiredItem); // convert to config case
    };
};

private _textures = getArray (_cfg >> "textures");
if (_textures isEqualTo []) then {
    ERROR_1("Failed compiling ACE_Tags for tag: %1 - missing textures",_class);
    _failure = true;
};

private _materials = getArray (_cfg >> "materials");

private _icon = getText (_cfg >> "icon");

private _tagModel = getText (_cfg >> "tagModel");
if (_tagModel == "") then {
    _tagModel = "UserTexture1m_F";
};

// Need to parse mission vs mod path for mission config
if (_isMission) then {
    _materials = _materials apply {
        GET_MOD_OR_MISSION_PATH(_x);
    };

    _textures = _textures apply {
        GET_MOD_OR_MISSION_PATH(_x);
    };

    // Only if path to model, either has subfolders or atleast a .p3d
    if ("\" in _tagModel || {"." in _tagModel}) then {
        _tagModel = GET_MOD_OR_MISSION_PATH(_tagModel);
    };
};



if (_failure) then {
    []
} else {
    [
        [_class, _displayName, _requiredItem, _textures, _icon, _materials, _tagModel],
        _requiredItem
    ]
}
