/*
 * Author: bux578
 * Initializes the SwitchUnits pbo.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private "_sides";

_sides = [];

if(GVAR(SwitchToWest)) then {_sides pushBack west};
if(GVAR(SwitchToEast)) then {_sides pushBack east};
if(GVAR(SwitchToIndependent)) then {_sides pushBack independent};
if(GVAR(SwitchToCivilian)) then {_sides pushBack civilian};

hint "TEST";

if (player getVariable ["ACE_CanSwitchUnits", false]) then {
    [player, _sides] call FUNC(initPlayer);
};
