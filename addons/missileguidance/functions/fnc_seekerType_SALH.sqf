#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: SALH (Laser)
 * Wrapper for ace_laser_fnc_seekerFindLaserSpot
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_SALH;
 *
 * Public: No
 */
#define MAX_AVERAGES 15
#define MINIMUM_DISTANCE_UNTIL_NEW_POS 1

params ["", "_args", "", "", "_timestep"];
_args params ["_firedEH", "_launchParams", "", "_seekerParams", "", "_targetData"];
_firedEH params ["","","","","","","_projectile"];
_launchParams params ["","","","","","_laserParams"];
_seekerParams params ["_seekerAngle", "", "_seekerMaxRange", "", ["_lastPositions", []], ["_lastPositionIndex", 0], ["_lastPositionSum", [0, 0, 0]]];
_laserParams params ["_code", "_wavelengthMin", "_wavelengthMax"];

private _laserResult = [(getPosASL _projectile), (velocity _projectile), _seekerAngle, _seekerMaxRange, [_wavelengthMin, _wavelengthMax], _code, _projectile] call EFUNC(laser,seekerFindLaserSpot);
private _foundTargetPos = _laserResult select 0;
TRACE_1("Search",_laserResult);

if (isNil "_foundTargetPos") exitWith {
    [0, 0, 0]
};

// average out any error from laser jump
private _positionSum = [0, 0, 0];
{
    _positionSum = _positionSum vectorAdd _x;
} forEach _lastPositions;

if (_foundTargetPos isNotEqualTo [0, 0, 0]) then {
    _lastPositions set [_lastPositionIndex % MAX_AVERAGES, _foundTargetPos];
    _seekerParams set [4, _lastPositions];
    _seekerParams set [5, _lastPositionIndex + 1];
};

private _aproximateVelocity = [0, 0, 0];
_positionSum = _positionSum vectorAdd _foundTargetPos;
if (MAX_AVERAGES == count _lastPositions) then {
    _positionSum = _positionSum vectorMultiply (1 / (1 + count _lastPositions));

    // if we are within a meter of the previous average, just use the previous average
    if (_positionSum distanceSqr _lastPositionSum < MINIMUM_DISTANCE_UNTIL_NEW_POS * MINIMUM_DISTANCE_UNTIL_NEW_POS) then {
        _positionSum = _lastPositionSum;
    };

    if (_timestep != 0) then {
        _aproximateVelocity = (_positionSum vectorDiff _lastPositionSum) vectorMultiply (1 / _timestep);
    };
} else {
    _positionSum = _positionSum vectorMultiply (1 / count _lastPositions);
};

_seekerParams set [6, _positionSum];

_targetData set [0, (getPosASL _projectile) vectorFromTo _positionSum];
_targetData set [3, _aproximateVelocity];

TRACE_3("laser target found",_foundTargetPos,_positionSum,count _lastPositions);

_positionSum
