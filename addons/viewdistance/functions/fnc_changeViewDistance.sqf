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
 * Public: Yes
 */

#include "script_component.hpp"

private ["_text","_new_view_distance","_view_distance_limit"];

// Change the received index number into an actual view distance:
_new_view_distance = [GVAR(viewDistance)] call FUNC(returnValue);
_view_distance_limit = GVAR(limitViewDistance); // Grab the limit

if (_new_view_distance <= _view_distance_limit) then {
    _text = composeText ["View distance successfully changed to: ",str(_new_view_distance)];
    [_text,1] call EFUNC(common,displayTextStructured);
    setViewDistance _new_view_distance;
    setObjectViewDistance (0.8 * _new_view_distance); // maybe make this 0.8 a constant?
}
else {
    _text = composeText ["That option is not allowed! The limit is: ",str(_view_distance_limit)];
    [_text,1] call EFUNC(common,displayTextStructured);
};