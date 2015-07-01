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

PARAMS_2(_modes,_add);

if (isNil "_add") then {
    if !(GVAR(registeredViewModes) isEqualTo _modes) then {
        GVAR(registeredViewModes) = _modes;
        ["bft_registeredModeChanged", [_modes,nil]] call EFUNC(common,localEvent);
    };
} else {
    private ["_changed"];
    _changed = false;
    
    if (_add) then {
        // figure out the real difference
        _modes = _modes - GVAR(registeredViewModes);
        if (count _modes > 0) then {
            GVAR(registeredViewModes) = GVAR(registeredViewModes) + _modes;
            _changed = true;
        };
    } else {
        // figure out the real difference
        _modes = GVAR(registeredViewModes) - (GVAR(registeredViewModes) - _modes);
        if (count _modes > 0) then {
            GVAR(registeredViewModes) = GVAR(registeredViewModes) - _modes;
            _changed = true;
        };
    };
    if (_changed) then {
        ["bft_registeredModeChanged", [_modes,_add]] call EFUNC(common,localEvent);
    };
};

true