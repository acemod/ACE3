/*
  Author(s):
    bux578
*/

#include "script_component.hpp"

//0 spawn {

private ["_sides"];

//waitUntil {sleep 0.5; AGM_SwitchUnits_EnableSwitchUnits};

//_side = [west, east, independent, civilian] select AGM_SwitchUnits_SwitchUnitsAllowedForSide;

_sides = [];

if(GVAR(SwitchToWest)) then {_sides pushBack west};
if(GVAR(SwitchToEast)) then {_sides pushBack east};
if(GVAR(SwitchToIndependent)) then {_sides pushBack independent};
if(GVAR(SwitchToCivilian)) then {_sides pushBack civilian};

if (player getVariable ["ACE_CanSwitchUnits", false]) then {
[player, _sides] call FUNC(initPlayer);
};
  
//};
