/*
 * Author: jaynus
 * Returns whether the seeker object can see the target position with lineIntersect
 *
 * Argument:
 * 0: Seeker [Object]
 * 1: Target [Object]
 * 
 * Return value:
 *    Boolean
 */
#include "script_component.hpp"
private["_seeker", "_seekerPos", "_target", "_targetPos", "_return", "_vectorTo", "_searchPos"];
_seeker = _this select 0;
_target = _this select 1;

_targetPos = getPosASL _target;
_seekerPos = getPosASL _seeker;
_return = true;

if(!(terrainIntersectASL [ _seekerPos, _targetPos])) then {
    if(lineIntersects [_seekerPos, _targetPos, _seeker, _target]) then {
        _return = false; 
    };
} else {
    _return = false;
};

_return;