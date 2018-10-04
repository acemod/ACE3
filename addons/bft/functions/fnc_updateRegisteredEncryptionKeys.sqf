/*
 * Author: Glowbal, Gundy
 *
 * Description: Either set, add or remove the registered encryption keys and trigger "bft_registeredEncryptionKeysChanged" event if a change occurred
 *
 * Arguments:
 * 0: Keys <ARRAY>
 *
 * Optional:
 *   1: add = TRUE, remove = FALSE <BOOLEAN>
 *
 * Return Value:
 * TRUE <BOOLEAN>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_keys", "_add"];

if (isNil "_add") then {
    if !(GVAR(registeredEncyptionKeys) isEqualTo _keys) then {
        GVAR(registeredEncyptionKeys) = _keys;
        ["bft_registeredEncryptionKeysChanged", [_keys,nil]] call CBA_fnc_localEvent;
    };
} else {
    private _changed = false;

    if (_add) then {
        // figure out the real difference
        _keys = _keys - GVAR(registeredEncyptionKeys);
        if !(_keys isEqualTo []) then {
            GVAR(registeredEncyptionKeys) = GVAR(registeredEncyptionKeys) + _keys;
            _changed = true;
        };
    } else {
        // figure out the real difference
        _keys = GVAR(registeredEncyptionKeys) - (GVAR(registeredEncyptionKeys) - _keys);
        if !(_keys isEqualTo []) then {
            GVAR(registeredEncyptionKeys) = GVAR(registeredEncyptionKeys) - _keys;
            _changed = true;
        };
    };
    if (_changed) then {
        ["bft_registeredEncryptionKeysChanged", [_keys,_add]] call CBA_fnc_localEvent;
    };
};

true
