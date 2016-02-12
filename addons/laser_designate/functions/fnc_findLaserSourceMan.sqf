/*
 * Author: esteldunedain
 * Handler function for laser network code for Men.
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 *    [position, direction]
 */

#include "script_component.hpp"

params ["_unit"];

// Get the laser target object stored in the unit
private _targetObject = _unit getVariable [QGVAR(targetObject), objNull];

// Origin position taken as man eyes
_povPos = AGLtoASL (_unit modelToWorldVisual (_unit selectionPosition "pilot"));
_povDir = vectorNormalized ((getPosASL _targetObject) vectorDiff _povPos);

TRACE_4("",_unit, _targetObject, _povPos, _povDir);

if(!isNil "_povPos" && !isNil "_povDir") exitWith {
    [_povPos, _povDir]
};

[-1,-1]
