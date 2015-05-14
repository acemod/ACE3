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
 * Public: No
 */

#include "script_component.hpp"

private ["_text","_new_view_distance","_view_distance_limit","_object_view_distance_coeff"];

PARAMS_2(_index_requested,_show_prompt);

_new_view_distance = [_index_requested] call FUNC(returnValue); // changes the setting index into an actual view distance value
_object_view_distance_coeff = [GVAR(objectViewDistanceCoeff)] call FUNC(returnObjectCoeff); // changes the setting index into a coefficient.
_view_distance_limit = GVAR(limitViewDistance); // Grab the limit

if (_new_view_distance <= _view_distance_limit) then {
    if (_show_prompt) then {
        _text = parseText format ["<t align='center'>View Distance: %1<br />Object View Distance Coefficient: %2</t>",str(_new_view_distance),str(_object_view_distance_coeff)];
        [_text,2] call EFUNC(common,displayTextStructured);
    };
    setViewDistance _new_view_distance;
    if (_object_view_distance_coeff > 0) then {
        setObjectViewDistance (_object_view_distance_coeff * _new_view_distance);
    };
}
else {
     if (_show_prompt) then {
        _text = parseText format ["<t align='center'>That option is invalid! The limit is: %1<br />Object View Distance Coefficient: %2</t>",str(_view_distance_limit),str(_object_view_distance_coeff)];
        [_text,2] call EFUNC(common,displayTextStructured);
    };
    setViewDistance _view_distance_limit;
    if (_object_view_distance_coeff > 0) then {
        setObjectViewDistance (_object_view_distance_coeff * _view_distance_limit);
    };
};