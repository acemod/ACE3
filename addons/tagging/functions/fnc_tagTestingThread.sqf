#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Checks if tags are still leaning on an object periodically.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tagging_fnc_tagTestingThread
 *
 * Public: No
 */

GVAR(tagsToTest) = GVAR(tagsToTest) select {
    _x params ["_tag", "_tagPosASL", "_vectorDirAndUp"];

    _vectorDirAndUp params ["_v1", "_v2"];

    private _endPosASL = _tagPosASL vectorAdd (_v1 vectorMultiply 0.08);

    // Check for intersections below the unit
    private _intersections = lineIntersectsSurfaces [_tagPosASL, _endPosASL, _tag, objNull, true, 1, "GEOM", "FIRE"];

    // If there's no intersections
    if (_intersections isEqualTo []) then {
        TRACE_1("No intersections, deleting:",_tag);
        deleteVehicle _tag;
        false
    } else {
        true
    };
};

// If there's no more tag
if (GVAR(tagsToTest) isEqualTo []) exitWith {
    GVAR(testingThread) = false;
};

// Schedule for execution again after 5 seconds
[DFUNC(tagTestingThread), [], 5] call CBA_fnc_waitAndExecute;
GVAR(testingThread) = true;
