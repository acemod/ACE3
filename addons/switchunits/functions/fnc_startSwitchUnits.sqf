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
    private _sides = [];

    if (GVAR(SwitchToWest)) then {_sides pushBack west;};
    if (GVAR(SwitchToEast)) then {_sides pushBack east;};
    if (GVAR(SwitchToIndependent)) then {_sides pushBack independent;};
    if (GVAR(SwitchToCivilian)) then {_sides pushBack civilian;};

    if (_player getVariable ["ACE_CanSwitchUnits", false]) then {
        [_player, _sides] call FUNC(initPlayer);
    };
};
