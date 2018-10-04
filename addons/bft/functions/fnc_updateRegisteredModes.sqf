/*
 * Author: Glowbal, Gundy
 *
 * Description: Either set, add or remove the registered modes (reporting modes / channels) and trigger "bft_registeredModeChanged" event if a change occurred
 *
 * Arguments:
 * 0: Modes <ARRAY>
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

params ["_modes", "_add"];

if (isNil "_add") then {
    if !(GVAR(registeredViewModes) isEqualTo _modes) then {
        GVAR(registeredViewModes) = _modes;
        ["bft_registeredModeChanged", [_modes,nil]] call CBA_fnc_localEvent;
    };
} else {
    private _changed = false;

    if (_add) then {
        // figure out the real difference
        _modes = _modes - GVAR(registeredViewModes);
        if !(_modes isEqualTo []) then {
            GVAR(registeredViewModes) = GVAR(registeredViewModes) + _modes;
            _changed = true;
        };
    } else {
        // figure out the real difference
        _modes = GVAR(registeredViewModes) - (GVAR(registeredViewModes) - _modes);
        if !(_modes isEqualTo []) then {
            GVAR(registeredViewModes) = GVAR(registeredViewModes) - _modes;
            _changed = true;
        };
    };

    if (_changed) then {
        ["bft_registeredModeChanged", [_modes,_add]] call CBA_fnc_localEvent;
    };
};

true
