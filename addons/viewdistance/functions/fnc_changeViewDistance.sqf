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

private ["_text", "_new_view_distance", "_view_distance_limit", "_object_view_distance_coeff"];

params ["_index_requested", "_show_prompt"];

_new_view_distance = [_index_requested] call FUNC(returnValue); // changes the setting index into an actual view distance value
_object_view_distance_coeff = [GVAR(objectViewDistanceCoeff)] call FUNC(returnObjectCoeff); // changes the setting index into a coefficient.
_view_distance_limit = GVAR(limitViewDistance); // Grab the limit

setViewDistance (_new_view_distance min _view_distance_limit);

if (typeName _object_view_distance_coeff == "SCALAR") then {
    if (_object_view_distance_coeff > 0) then {
        setObjectViewDistance (_object_view_distance_coeff * viewDistance);
    } else {
        // Restore correct view distance when changing from FoV Based to Off
        // Restoring directly inside PFH's self-exit resulted in the need of selecting another option to take effect
        setObjectViewDistance GVAR(fovBasedPFHminimalViewDistance);
    };
} else {
    if (isNil QGVAR(fovBasedPFHminimalViewDistance)) then {
        GVAR(fovBasedPFHminimalViewDistance) = getObjectViewDistance select 0; // Minimal view distance holder and PFH isRunning variable
        [FUNC(setFovBasedOvdPFH), 0, []] call CBA_fnc_addPerFrameHandler;
    };
};

if (_show_prompt) then {
    if (GVAR(objectViewDistanceCoeff) > 0) then {
        // FoV Based or %
        if (GVAR(objectViewDistanceCoeff) == 6) then {
            _text = format ["<t align='center'>%1 %2<br/>Min. %3<br/>Max. %4</t>", localize LSTRING(objectinfotext), localize LSTRING(object_fovBased), GVAR(fovBasedPFHminimalViewDistance), viewDistance];
        } else {
            _text = if (_new_view_distance <= _view_distance_limit) then {
                        format ["<t align='center'>%1 %2m", localize LSTRING(infotext), viewDistance];
                    } else {
                        format ["<t align='center'>%1 %2m", localize LSTRING(invalid), viewDistance];
                    };
            _text = _text + format ["<br/><t align='center'>%1 %2%3</t>", localize LSTRING(objectinfotext), _object_view_distance_coeff * 100, "%"];
        };
        [parseText _text, 2] call EFUNC(common,displayTextStructured);
    };
};
