/*
 * Author: esteldunedain
 * Copy recieved markers to map
 *
 * Arguments:
 * 0: Array of markers to copy <ARRAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_lineMarkers);

{
    private "_marker";
    _marker = _x;
    //Add marker if we don't already have it
    if (({(_x select 0) == (_marker select 0)} count GVAR(drawing_lineMarkers)) == 0) then {
        _marker call FUNC(addLineMarker);
    };
} forEach _lineMarkers;
