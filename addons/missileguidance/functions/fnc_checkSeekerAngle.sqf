/*
 * Author: jaynus
 * Returns whether the target position is within the maximum angle FOV of the provided seeker
 * objects current direction.
 *
 * Arguments:
 * 0: Seeker <OBJECT>
 * 1: Target PosASL <ARRAY>
 * 2: Max Angle (degrees) <NUMBER>
 *
 * Return Value:
 * Can See <BOOL>
 *
 * Example:
 * [player, cursorTarget, 45] call ace_missileguidance_fnc_checkSeekerAngle;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_seeker", "_targetPos", "_seekerMaxAngle"];

private _sensorPos = getPosASL _seeker;

private _testPointVector = vectorNormalized (_targetPos vectorDiff _sensorPos);
private _testDotProduct = (vectorNormalized (velocity _seeker)) vectorDotProduct _testPointVector;

TRACE_2("fov",acos _testDotProduct,_seekerMaxAngle);

if (_testDotProduct < (cos _seekerMaxAngle)) exitWith {
    false
};

true
