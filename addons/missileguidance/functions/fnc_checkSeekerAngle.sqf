/*
 * Author: jaynus
 * Returns whether the target position is within the maximum angle FOV of the provided seeker 
 * objects current direction.
 *
 * Argument:
 * 0: Seeker [Object]
 * 1: Target [Position]
 * 2: Max Angle [Degrees]
 * 
 * Return value:
 *    Boolean
 */

#include "script_component.hpp"
private["_seeker", "_targetPos", "_seekerMaxAngle", "_sensorPos", "_testPointVector", "_testDotProduct"];

_seeker = _this select 0;
_targetPos = _this select 1;
_seekerMaxAngle = _this select 2;

_sensorPos = getPosASL _seeker;

_testPointVector = vectorNormalized (_targetPos vectorDiff _sensorPos);
_testDotProduct = (vectorNormalized (velocity _seeker)) vectorDotProduct _testPointVector;

if(_testDotProduct < (cos _seekerMaxAngle)) exitWith {
    false 
};

true