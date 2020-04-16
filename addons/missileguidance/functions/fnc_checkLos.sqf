#include "script_component.hpp"
/*
 * Author: jaynus
 * Returns whether the seeker object can see the target position with checkVisibility
 *
 * Arguments:
 * 0: Seeker <OBJECT>
 * 1: Target <OBJECT>
 * 2: Whether or not to use checkVisibility to test for LOS <BOOLEAN>
 *
 * Return Value:
 * Has LOS <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_missileguidance_fnc_checkLOS;
 *
 * Public: No
 */

params ["_seeker", "_target", ["_checkVisibilityTest", true]];

// Boolean checkVisibilityTest so that if the seeker type is one that ignores smoke we revert back to raw LOS checking.
if (_checkVisibilityTest) exitWith {
    private _visibility = [_seeker, "VIEW", _target] checkVisibility [getPosASL _seeker, aimPos _target];
    _visibility > 0.001
};
if ((isNil "_seeker") || {isNil "_target"}) exitWith {
    ERROR_2("nil",_seeker,_target);
    false
};

private _targetPos = getPosASL _target;
private _targetAimPos = aimPos _target;
private _seekerPos = getPosASL _seeker;
private _return = true;

if (!((terrainIntersectASL [_seekerPos, _targetPos]) && {terrainIntersectASL [_seekerPos, _targetAimPos]})) then {
    if (lineIntersects [_seekerPos, _targetPos, _seeker, _target]) then {
        _return = false;
    };
} else {
    _return = false;
};

_return

