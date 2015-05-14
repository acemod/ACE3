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

private ["_text","_new_view_distance","_view_distance_limit","_object_view_distance_coeff"];
PARAMS_2(_index_requested,_show_prompt);

_new_view_distance = [_index_requested] call FUNC(returnValue); // change the index into an actual view distance value
_object_view_distance_coeff = [GVAR(objectViewDistanceCoeff)] call FUNC(returnObjectCoeff);
_view_distance_limit = GVAR(limitViewDistance); // Grab the limit

if (_new_view_distance <= _view_distance_limit) then {
    if (_show_prompt) then {
        //_text = composeText ["View distance successfully changed to: ",str(_new_view_distance)];
        _text = format ["View distance successfully changed to: %1, Object View Distance Coefficient is: %2",str(_new_view_distance),str(_object_view_distance_coeff)];
        [_text,3] call EFUNC(common,displayTextStructured);
    };
    setViewDistance _new_view_distance;
    if (_object_view_distance_coeff > 0) then {
        setObjectViewDistance (_object_view_distance_coeff * _new_view_distance);
    };
}
else {
     if (_show_prompt) then {
        //_text = composeText ["That option is invalid! The limit is: ",str(_view_distance_limit)];
        _text = format ["That option is invalid! The limit is: %1, Object View Distance Coefficient is: %2",str(_view_distance_limit),str(_object_view_distance_coeff)];
        [_text,3] call EFUNC(common,displayTextStructured);
        setViewDistance _view_distance_limit;
        if (_object_view_distance_coeff > 0) then {
            setObjectViewDistance (_object_view_distance_coeff * _view_distance_limit);
        };
    };
};