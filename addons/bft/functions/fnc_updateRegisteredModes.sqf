/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: add <BOOLEAN>
 * 1: modes <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_add,_modes);

if (_add) then {
    private ["_difference"];
    _difference = _modes - GVAR(registeredViewModes);
    {
        GVAR(registeredViewModes) pushBack _x;
    } forEach _modes;
    _modes = _difference;
} else {
    GVAR(registeredViewModes) = GVAR(registeredViewModes) - _modes;
};

["bft_registeredModeChanged", [_add, _modes]] call EFUNC(common,localEvent);
