#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Updates camera to be on a fixed point
 *
 * Arguments:
 * 0: Camera Array <ARRAY>
 * 1: Projectile <OBJECT>
 * 2: Delta time <NUMBER>
 * 3: Camera Namespace <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_spike_fnc_camera_update
 *
 * Public: No
 */
params ["_cameraArray", "_projectile", "_deltaTime", "_cameraNamespace"];
_cameraArray params ["_hasCamera", "", "", "", "", "", "", "", "_viewData", "_gimbalData", "", "_designating", "_canStopDesignating"];
_viewData params ["_lookDir", "_groundPos", "_pointPos", "_movingCameraX", "_movingCameraY"];
_gimbalData params ["_hasGimbal", "_maxGimbalX", "_maxGimbalY", "_gimbalSpeedX", "_gimbalSpeedY", "", "", "_gimbalZoomSpeedModifiers", "_stabilizeWhenMoving", "_designateWhenStationary", "_trackLockedPosition"];

if (!_hasCamera || { isNull _cameraNamespace }) exitWith {};

if ([_cameraNamespace] call FUNC(camera_userInCamera)) then {
    cameraEffectEnableHUD true;
};

private _camera = _cameraNamespace getVariable [QGVAR(camera), nil];
private _logic = _cameraNamespace getVariable [QGVAR(logic), objNull];

private _fovChanged = _cameraNamespace getVariable [QGVAR(fovChanged), false];
private _cameraOffset = _cameraNamespace getVariable [QGVAR(projectileSize), 0];
private _missileDirection = vectorNormalized velocity _projectile;
private _cameraPosASL = (getPosASLVisual _projectile) vectorAdd (_missileDirection vectorMultiply _cameraOffset);

private _designatedLastFrame = _cameraNamespace getVariable [QGVAR(designatedLastFrame), false];
if (_designatedLastFrame && !_canStopDesignating && { !(_groundPos isEqualTo [0, 0, 0] && _pointPos isEqualTo [0, 0, 0]) }) then {
    _designating = true;
};

if (!_designating && _designatedLastFrame) then {
    _designatedLastFrame = false;
    _cameraNamespace setVariable [QGVAR(designatedLastFrame), _designatedLastFrame];
};

if (_fovChanged) then {
    private _lerpFovEnabled = _cameraNamespace getVariable [QGVAR(lerpFOVChange), false];
    private _targetFOV = _cameraNamespace getVariable [QGVAR(targetFOV), 1];
    private _currentFOV = _cameraNamespace getVariable [QGVAR(currentFOV), 1];
    private _fovChangeStart = _cameraNamespace getVariable [QGVAR(fovChangedTime), 0];
    private _startingFOV = _cameraNamespace getVariable [QGVAR(startingFov), 1];
    private _fovChangeTime = _cameraNamespace getVariable [QGVAR(fovChangeTime), 0];

    private _setFOV = _targetFOV;
    if (_lerpFovEnabled) then {
        _setFOV = linearConversion [0, _fovChangeTime, CBA_missionTime - _fovChangeStart, _startingFOV, _targetFOV, true];
    } else {
        _fovChanged = false;
    };

    // if the FOV is near enough to the target FOV stop the lerp
    if (abs(_setFOV - _targetFOV) == 0 || ((CBA_missionTime - _fovChangeStart) > _fovChangeTime + 2)) then {
        _setFOV = _targetFOV;
        _fovChanged = false;
    };

    _camera camSetFov _setFOV;
    _cameraNamespace setVariable [QGVAR(fovChanged), _fovChanged];
    _cameraNamespace setVariable [QGVAR(currentFOV), _setFOV];
};

_movingCameraX = false;
_movingCameraY = false;

private _relativePos = _cameraNamespace getVariable [QGVAR(logicPos), _missileDirection vectorMultiply GIMBAL_LOGIC_OFFSET];
private _expectedPos = _relativePos;
if (_hasGimbal) then {
    private _lookInput = _cameraNamespace getVariable [QGVAR(lookInput), [0, 0, 0, 0]];
    _lookInput params ["_up", "_down", "_left", "_right"];

    _movingCameraX = (_right - _left) != 0;
    _movingCameraY = (_up - _down) != 0;

    private _lastGroundPos = _cameraNamespace getVariable [QGVAR(lastMovedGroundPos), [0, 0, 0]];

    if !(_movingCameraX || _movingCameraY) then {
        // ToDo: Unreachable code, var known undefined //IGNORE_PRIVATE_WARNING ["_seekerTargetPos"];
        // If we designate a target set the current tracking point to the current ground point to avoid unwanted behavior from static cameras
        if (_designating && !_designatedLastFrame) then {
            _designatedLastFrame = true;
            _cameraNamespace setVariable [QGVAR(designatedLastFrame), _designatedLastFrame];
            _lastGroundPos = _groundPos;
            _cameraNamespace setVariable [QGVAR(lastMovedGroundPos), _lastGroundPos];
        };

        if (_trackLockedPosition && _canStopDesignating && { _seekerTargetPos isNotEqualTo [0, 0, 0] }) then {
            _lastGroundPos = _seekerTargetPos;
        };

        // lock the camera and dont gimbal with missile rotation
        if (_lastGroundPos isNotEqualTo [0, 0, 0]) then {
            #ifdef DEBUG_MODE_FULL
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 1, 1, 1], ASLToATL (_lastGroundPos), 0.75, 0.75, 0, "Last Camera Ground Position", 1, 0.025, "TahomaB"];
            #endif
            private _directionToGround = _cameraPosASL vectorFromTo _lastGroundPos;
            (_directionToGround call CBA_fnc_vect2polar) params ["", "_azimuth", "_elevation"];

            _expectedPos = _directionToGround vectorMultiply GIMBAL_LOGIC_OFFSET;
        };
    } else {
        private _speedModifier = 1;
        if (_gimbalZoomSpeedModifiers isNotEqualTo []) then {
            _speedModifier = (_gimbalZoomSpeedModifiers select (_cameraNamespace getVariable [QGVAR(currentZoomIndex), 0]));
        };

        private _offsetX = (_speedModifier * _gimbalSpeedX * _deltaTime * (_right - _left));
        private _offsetY = (_speedModifier * _gimbalSpeedY * _deltaTime * (_up - _down));

        private _directionToLast = _relativePos;
        if (_groundPos isNotEqualTo [0, 0, 0]) then {
            private _lastLogicPos = getPosASLVisual _logic;
            _directionToLast = _cameraPosASL vectorFromTo _groundPos;
        };

        (_directionToLast call CBA_fnc_vect2polar) params ["", "_azimuth", "_elevation"];

        _expectedPos = [GIMBAL_LOGIC_OFFSET, _azimuth + _offsetX, _elevation + _offsetY] call CBA_fnc_polar2vect;
    };
};

_relativePos = _expectedPos;
(_relativePos call CBA_fnc_vect2polar) params ["", "_azimuth", "_elevation"];
(_missileDirection call CBA_fnc_vect2polar) params ["", "", "_missilePitch"];

private _projectileDir = vectorDirVisual _projectile;
_projectileDir set [2, 0];

private _2dRelativePos = [_relativePos#0, _relativePos#1, 0];

private _cameraAzimuth = acos (_projectileDir vectorCos _2dRelativePos);
private _cameraElevation = _missilePitch - _elevation;

if (_cameraAzimuth > _maxGimbalX) then {
    private _maxDirection = (direction _projectile) + _maxGimbalX;

    private _crossProductSign = (_2dRelativePos vectorCrossProduct _projectileDir)#2;
    if (_crossProductSign < 0) then {
        _maxDirection = (direction _projectile) - _maxGimbalX;
    };

    if (_maxDirection >= 360) then {
        _maxDirection = _maxDirection - 360;
    };

    if (_maxDirection < 0) then {
        _maxDirection = 360 + _maxDirection;
    };

    private _maxVec = [GIMBAL_LOGIC_OFFSET, _maxDirection, _elevation] call CBA_fnc_polar2vect;
    _relativePos set [0, _maxVec select 0];
    _relativePos set [1, _maxVec select 1];

    _azimuth = _maxDirection;
};

if (abs(_cameraElevation) >= _maxGimbalY) then {
    private _maxElevation = _missilePitch + _maxGimbalY;
    if (_cameraElevation > 0) then {
        _maxElevation = _missilePitch - _maxGimbalY;
    };

    if (_maxElevation >= 360) then {
        _maxElevation = 360 - _maxElevation;
    };

    if (_maxElevation < 0) then {
        _maxElevation = 360 + _maxElevation;
    };

    private _maxVec = [GIMBAL_LOGIC_OFFSET, _azimuth, _maxElevation] call CBA_fnc_polar2vect;
    _relativePos set [2, _maxVec select 2];
};

_designating = (!_canStopDesignating && _designating) || { _cameraNamespace getVariable [QGVAR(alwaysDesignate), false] || { (_cameraNamespace getVariable [QGVAR(designateInput), [0]])#0 == 1 } };
if (_designateWhenStationary && !(_movingCameraX || _movingCameraY)) then {
    _designating = true;
};
_cameraNamespace setVariable [QGVAR(logicPos), _relativePos];
_cameraNamespace setVariable [QGVAR(cameraPos), _cameraPosASL];

private _posAddedASL = _cameraPosASL vectorAdd _relativePos;

_logic setPosASL _posAddedASL;

_camera camSetTarget _logic;
_camera setPosASL _cameraPosASL;

_lookDir = _cameraPosASL vectorFromTo (getPosASL _logic);

private _projectedPos = _cameraPosASL vectorAdd (_lookDir vectorMultiply 10000);

private _surfaceIntersections = lineIntersectsSurfaces [_cameraPosASL, _projectedPos, _projectile, _logic];

private _pointPos = [0, 0, 0];
private _groundPos = terrainIntersectAtASL [_cameraPosASL, _projectedPos];

if (_surfaceIntersections isNotEqualTo []) then {
    _pointPos = (_surfaceIntersections select 0) select 0;
};

if (_movingCameraX) then {
    _cameraNamespace setVariable [QGVAR(lastMovedGroundPosX), _groundPos];
};
if (_movingCameraY) then {
    _cameraNamespace setVariable [QGVAR(lastMovedGroundPosY), _groundPos];
};
if (_movingCameraX || _movingCameraY) then {
    _cameraNamespace setVariable [QGVAR(lastMovedGroundPos), _groundPos];
};

_cameraArray set [11, _designating];

#ifdef DEBUG_MODE_FULL
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 0.5, 1, 1], ASLToAGL _cameraPosASL, 0.75, 0.75, 0, "Camera Pos", 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 0.5, 1, 1], getPosATL _logic, 0.75, 0.75, 0, "Logic Pos", 1, 0.025, "TahomaB"];

drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0, 1, 1, 1], ASLToAGL (_groundPos), 0.75, 0.75, 0, "Camera Ground Position", 1, 0.025, "TahomaB"];
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1, 1, 0, 1], ASLToAGL (_pointPos), 0.75, 0.75, 0, "Camera Point Position", 1, 0.025, "TahomaB"];
#endif

_viewData set [0, _lookDir];
_viewData set [1, _groundPos];
_viewData set [2, _pointPos];
_viewData set [3, _movingCameraX];
_viewData set [4, _movingCameraY];
_cameraArray set [8, _viewData];

_camera camCommit 0;

[_cameraNamespace, _cameraArray] call FUNC(camera_updateTargetingGate);
