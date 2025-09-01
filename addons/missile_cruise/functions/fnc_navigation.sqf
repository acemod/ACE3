#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Determine path for projectile to take in accordance to proportional navigation
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Commanded acceleration normal to LOS in world space <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_navigationType_proNav
 *
 * Public: No
 */
params ["_args", "_timestep", "_seekerTargetPos", "_profileAdjustedTargetPos"];
_args params ["_firedEH", "", "_flightParams", "", "_stateParams", "_targetData"];
_firedEH params ["","","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams", "", "","_navigationParams", "_angles"];
_angles params ["_missileYaw", "", "_missilePitch"];
_flightParams params ["_pitchRate", "_yawRate"];

_navigationParams params ["_state", "_lastMissilePitch", "_missilePitchHistory", "_missilePitchHistoryIdx"];

_missilePitchHistory set [_missilePitchHistoryIdx, _missilePitch];
_navigationParams set [1, _missilePitch];
_navigationParams set [3, (_missilePitchHistoryIdx + 1) % count _missilePitchHistory];

private _iTimestep = 0;
if (_timestep != 0) then {
    _iTimestep = 1 / _timestep;
};

private _missilePitchSum = 0;
{
    if (_forEachIndex == _missilePitchHistoryIdx) then {
        continue;
    };
    _missilePitchSum = _missilePitchSum + _x;
} forEach _missilePitchHistory;
private _averageLastPitch = _missilePitchSum / ((count _missilePitchHistory) - 1);

private _deltaMissilePitch = (_missilePitch - _averageLastPitch) * _iTimestep / count _missilePitchHistory;

_seekerStateParams params ["", "_position", "_velocity"];

private _direction = vectorNormalized _velocity;

private _directionToTarget = [_seekerTargetPos#0, _seekerTargetPos#1, 0] vectorDiff [_position#0, _position#1, 0];
private _distance = vectorMagnitude _directionToTarget;
_directionToTarget = vectorNormalized _directionToTarget;

private _velocityInDirection = _directionToTarget vectorMultiply (_velocity vectorDotProduct _directionToTarget);
private _timeToGo = _distance / vectorMagnitude _velocityInDirection;

private _zeroEffortMiss = _position vectorAdd (_velocity vectorMultiply _timeToGo);
_zeroEffortMiss = _seekerTargetPos vectorDiff _zeroEffortMiss;

private _cmdAccel = [0, 0, 0];
switch (_state) do {
    case NAVIGATION_STATE_LAUNCH: {
        private _deltaDirection = _directionToTarget vectorDiff _direction;
        _deltaDirection = _projectile vectorWorldToModelVisual _deltaDirection;
        _deltaDirection = _deltaDirection vectorMultiply [_yawRate, 0, _pitchRate];
        _cmdAccel = _projectile vectorModelToWorldVisual _deltaDirection;
        
        if (abs (0 - _missilePitch) < 30) then {
            _navigationParams set [0, NAVIGATION_STATE_FLIGHT];
        };
    };
    case NAVIGATION_STATE_FLIGHT: {
        private _targetAltitude = _seekerTargetPos select 2;
        private _altitude = _position select 2;
        private _altitudeAtTtg = _altitude + _timeToGo * (_velocity select 2);

        private _pitchAtTtg = _missilePitch + _deltaMissilePitch * _timeToGo;

        private _gain = 12;
        private _verticalCommand = (0 - _pitchAtTtg) / (3 * _timeToGo ^ 3) + (_targetAltitude - _altitudeAtTtg) / _timeToGo;
        private _horizontalCommand = _zeroEffortMiss vectorMultiply _yawRate;
        _cmdAccel = [_horizontalCommand select 0, _horizontalCommand select 1, _gain * _verticalCommand * _pitchRate];
    };
    case NAVIGATION_STATE_TERMINAL: {

    };
};

if (EGVAR(missileguidance,debug_drawGuidanceInfo)) then {
    private _drift = vectorMagnitude ((getPosASLVisual _projectile) vectorDiff _position);
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], getPos _projectile, 0.75, 0.75, 0, format ["Drift: %1m", _drift], 1, 0.025, "TahomaB"];
};

_cmdAccel // return
