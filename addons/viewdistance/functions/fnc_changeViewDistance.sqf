/*
 * Author: Winter
 * Sets the player's current view distance according to allowed values.
 * 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_changeViewDistance;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_new_view_distance","_new_view_distance_limit"];

_new_view_distance = [GVAR(newViewDistance)] call FUNC(returnViewDistanceValue);
_view_distance_limit = [GVAR(topViewDistanceLimit)] call FUNC(returnViewDistanceValue);

if !GVAR(changeAllowed) then {
    hint "You are not allowed to change the view distance!";
} else {
    if (_new_view_distance > _view_distance_limit) then {
        hint format ["That option is not allowed! The limit is: %1m",_view_distance_limit];
    }
    else {
        hint format ["View distance successfully changed to: %1m",_new_view_distance];
        setViewDistance _new_view_distance;
    };
};

// To do: add a check against a  module limit.