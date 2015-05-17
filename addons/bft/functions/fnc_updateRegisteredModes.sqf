/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_add", "_modes", "_difference"];
_add = _this select 0;
_modes = _this select 1;

if (_add) then {
    _difference = _modes - GVAR(registeredViewModes);
    { GVAR(registeredViewModes) pushback _x; }foreach _modes;
    _modes = _difference;
} else {
    GVAR(registeredViewModes) = GVAR(registeredViewModes) - _modes;
};

["bft_registeredModeChanged", [_add, _modes]] call EFUNC(common,localEvent);
