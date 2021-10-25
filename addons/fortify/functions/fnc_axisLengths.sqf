#include "script_component.hpp"
/*
 * Author: Kingsley
 * Gets the longest axis of the bounding box of the given object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Lengths <ARRAY>
 *
 * Example:
 * [_object] call ace_fortify_fnc_axisLengths;
 *
 * Public: Yes
 */

params [["_object", objNull, [objNull]]];

(boundingBoxReal _object) params ["_p1", "_p2"];

[
    (abs ((_p2 select 0) - (_p1 select 0))),
    (abs ((_p2 select 1) - (_p1 select 1))),
    (abs ((_p2 select 2) - (_p1 select 2)))
]
