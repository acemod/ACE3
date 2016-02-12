/*
 * Author: esteldunedain
 * Handler function for laser network code.
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 *    [position, direction]
 */

#include "script_component.hpp"

params ["_unit"];

private _targetObject = _unit getVariable [QGVAR(targetObject), objNull];

//@todo: Improve depending on type of object?
_povPos = getPosASL _unit;
_povDir = vectorNormalized ((getPosASL _targetObject) vectorDiff _povPos);

if(!isNil "_povPos" && !isNil "_povDir") exitWith {
    [_povPos, _povDir]
};

[-1,-1]
