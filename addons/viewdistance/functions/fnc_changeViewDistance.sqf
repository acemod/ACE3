/*
 * Author: Winter
 * Sets the player's current view distance according to allowed values.
 * 
 *
 * Arguments:
 * 0: View Distance setting INDEX <SCALAR>
 * 1: Show Prompt <BOOL>
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
PARAMS_2(_index_requested,_prompt);

_new_view_distance = [_index_requested] call FUNC(returnValue); // change the index into an actual view distance value
_view_distance_limit = GVAR(limitViewDistance); // Grab the limit

if (_new_view_distance <= _view_distance_limit) then {
    if (_prompt) then {
        _text = composeText ["View distance: ",str(_new_view_distance)];
        [_text,1] call EFUNC(common,displayTextStructured);
    };
    setViewDistance _new_view_distance;
    setObjectViewDistance (0.8 * _new_view_distance); // maybe make this 0.8 a constant?
}
else {
     if (_prompt) then {
        _text = composeText ["That option is invalid! The limit is: ",str(_view_distance_limit)];
        [_text,1] call EFUNC(common,displayTextStructured);
        setViewDistance _view_distance_limit;
        setObjectViewDistance (0.8 * _view_distance_limit); // maybe make this 0.8 a constant?
    };
};