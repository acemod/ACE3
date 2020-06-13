#include "script_component.hpp"
/*
 * Author: bux578
 * Starts the SwitchUnits functionality
 *
 * Arguments:
 * 0: player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player] call ace_switchunits_fnc_startSwitchUnits
 *
 * Public: No
 */

params ["_player"];

if (GVAR(EnableSwitchUnits)) then {
    GVAR(switchableSides) = [];

    if (GVAR(SwitchToWest)) then {GVAR(switchableSides) pushBack west;};
    if (GVAR(SwitchToEast)) then {GVAR(switchableSides) pushBack east;};
    if (GVAR(SwitchToIndependent)) then {GVAR(switchableSides) pushBack independent;};
    if (GVAR(SwitchToCivilian)) then {GVAR(switchableSides) pushBack civilian;};

    if (_player getVariable ["ACE_CanSwitchUnits", false]) then {
        [_player] call FUNC(initPlayer);
    };
};
