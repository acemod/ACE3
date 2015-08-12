/*
 * Author: Winter
 * Sets the player's current view distance according to allowed values.
 *
 * Arguments:
 * 0: View Distance setting INDEX <SCALAR>
 * 1: Show Prompt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_viewdistance_fnc_changeViewDistance
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_text","_new_view_distance","_view_distance_limit","_object_view_distance_coeff"];

params ["_index_requested", "_show_prompt"];

_new_view_distance = [_index_requested] call FUNC(returnValue); // changes the setting index into an actual view distance value
_object_view_distance_coeff = [GVAR(objectViewDistanceCoeff)] call FUNC(returnObjectCoeff); // changes the setting index into a coefficient.
_view_distance_limit = GVAR(limitViewDistance); // Grab the limit

setViewDistance (_new_view_distance min _view_distance_limit);

if (_object_view_distance_coeff > 0) then {
    setObjectViewDistance (_object_view_distance_coeff * viewDistance);
};

if (_show_prompt) then {
    _text = if (_new_view_distance <= _view_distance_limit) then {
            format ["<t align='center'>%1 %2m", (localize "STR_ACE_ViewDistance_infotext"), str(viewDistance)];
        } else {
            format ["<t align='center'>%1 %2m", (localize "STR_ACE_ViewDistance_invalid"), str(viewDistance)];
        };

    if (GVAR(objectViewDistanceCoeff) > 0) then {
        _text = _text + format ["<br/><t align='center'>%1 %2%3</t>", (localize "STR_ACE_ViewDistance_objectinfotext"), str(_object_view_distance_coeff * 100),"%"];
    };
    [parseText _text,2] call EFUNC(common,displayTextStructured);
};
