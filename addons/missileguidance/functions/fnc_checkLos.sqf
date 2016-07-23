/*
 * Author: jaynus
 * Returns whether the seeker object can see the target position with lineIntersect
 *
 * Arguments:
 * 0: Seeker [Object]
 * 1: Target [Object]
 *
 * Return Value:
 *    Boolean
 */
#include "script_component.hpp"

params ["_seeker", "_target"];

if ((isNil "_seeker") || {isNil "_target"}) exitWith {false};

private _targetPos = getPosASL _target;
private _targetAimPos = aimPos _target;
private _seekerPos = getPosASL _seeker;
private _return = true;

if (!((terrainIntersectASL [_seekerPos, _targetPos]) && {terrainIntersectASL [_seekerPos, _targetAimPos]})) then {
    if(lineIntersects [_seekerPos, _targetPos, _seeker, _target]) then {
        _return = false;
    };
} else {
    _return = false;
};

_return;