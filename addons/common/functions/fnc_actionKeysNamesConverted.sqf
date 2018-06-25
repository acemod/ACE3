#include "script_component.hpp"
/*
 * Author: commy2
 * Reports same as actionKeysNames(Array) but in a format processable by "keyDown".
 *
 * Arguments:
 * 0: Action name <STRING>
 *
 * Return Value:
 * Keybinds, format: [DIK, _shift, _ctrl, _alt] <ARRAY>
 *
 * Example:
 * "ReloadMagazine" call ace_common_fnc_actionKeysNamesConverted
 *
 * Public: No
 */

#define LAST_DIK 250
#define PLACEHOLDER_PLUS "<PLUS>"

#define LKEYNAME_LSHIFT localize "STR_DIK_LSHIFT"
#define LKEYNAME_RSHIFT localize "STR_DIK_RSHIFT"
#define LKEYNAME_LCONTROL localize "STR_DIK_LCONTROL"
#define LKEYNAME_RCONTROL localize "STR_DIK_RCONTROL"
#define LKEYNAME_LALT localize "STR_DIK_LMENU"
#define LKEYNAME_RALT localize "STR_DIK_RMENU"

// stored in ui namespace to force it to be recreated every game start
// this way we make it work in savegames after a language change
private _keyTable = uiNamespace getVariable QGVAR(keyNameTable);

if (isNil "_keyTable") then {
    _keyTable = [];
    uiNamespace setVariable [QGVAR(keyNameTable), _keyTable];

    for "_i" from 0 to LAST_DIK do {
        private _keyName = keyName _i;

        // keys are reported as nested strings for god knows why
        _keyName = _keyName select [1, count _keyName - 2];

        _keyTable pushBack _keyName;
    };
};

private _keyCache = uiNamespace getVariable [QGVAR(keyNameCache), locationNull];

if (isNull _keyCache) then {
    _keyCache = call CBA_fnc_createNamespace;
    uiNamespace setVariable [QGVAR(keyNameCache), _keyCache];
};

params [["_action", "", [""]]];

private _keybinds = actionKeysNamesArray _action apply {
    private _keyName = _x;
    private _keybind = _keyCache getVariable _keyName;

    if (isNil "_keybind") then {
        private _key = -1;
        private _shift = false;
        private _ctrl = false;
        private _alt = false;

        // copy, keep original varname for cache
        private _keyImage = _keyName;

        // handle "+" being a key and the seperator - as first character
        if ((_keyImage select [0,1]) isEqualTo "+") then {
            _keyImage = PLACEHOLDER_PLUS + (_keyImage select [1]);
        };

        // - and as character seperated by "+"
        _keyImage = [_keyImage, "++", "+" + PLACEHOLDER_PLUS] call CBA_fnc_replace;

        // get single keys (also revert back non-seperator "+" keys)
        _keyImage = _keyImage splitString "+" apply {
            [_x, "+"] select (_x isEqualTo PLACEHOLDER_PLUS);
        };

        // parse single keys
        {
            switch (true) do {
                case (_x in [LKEYNAME_LSHIFT, LKEYNAME_RSHIFT]): {
                    _shift = true;
                };
                case (_x in [LKEYNAME_LCONTROL, LKEYNAME_RCONTROL]): {
                    _ctrl = true;
                };
                case (_x in [LKEYNAME_LALT, LKEYNAME_RALT]): {
                    _alt = true;
                };
                default {
                    // @todo handle double keys? ("C + R")
                    // currently only reports last key
                    // not usable by keyDown by default
                    _key = _keyTable find _x;
                };
            };
        } forEach _keyImage;

        // cache
        _keybind = [_key, _shift, _ctrl, _alt];
        _keyCache setVariable [_keyName, _keybind];
    };

    _keybind
};

_keybinds
