#include "script_component.hpp"
/*
 * Author: jaynus
 * Returns whether the target position is within the maximum angle FOV of the provided seeker
 * objects current direction.
 *
 * Arguments:
 * 0: Seeker <OBJECT>
 * 1: Target PosASL <ARRAY>
 * 2: Search Vector <ARRAY>
 * 3: Max Angle (degrees) <NUMBER>
 *
 * Return Value:
 * Can See <BOOL>
 *
 * Example:
 * [player, cursorTarget, 45] call ace_missileguidance_fnc_checkSeekerAngle;
 *
 * Public: No
 */

params ["_pos", "_targetPos", "_direction", "_maxAngle"];

_vectorFromTo = _pos vectorFromTo _targetPos;

_dotProd = _vectorFromTo vectorDotProduct (vectorNormalized _direction);

if (_dotProd < (cos _maxAngle)) exitWith {
    false
};

true
