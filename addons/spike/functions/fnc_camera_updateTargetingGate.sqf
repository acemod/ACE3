#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Switches away from the currently controlled camera
 *
 * Arguments:
 * 0: Camera <OBJECT>
 * 1: Camera Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam, []] call ace_spike_fnc_camera_updateTargetingGate
 *
 * Public: No
 */
params ["_cameraNamespace", "_cameraArray"];
_cameraArray params ["", "", "", "", "", "", "", "", "_viewData", "_gimbalData", "_reticleData", "_designating"];
_viewData params ["_lookDir", "_groundPos", "_pointPos", "_movingCameraX", "_movingCameraY", "_stabilizeWhenMoving"];
_gimbalData params ["_hasGimbal", "_maxGimbalX", "_maxGimbalY", "_gimbalSpeedX", "_gimbalSpeedY", "", "", "_gimbalZoomSpeedModifiers"];
_reticleData params ["", "", "", "", "", "", "", "", "", "_reticleMovesWithTrack"];

if !([_cameraNamespace] call FUNC(camera_userInCamera)) exitWith {};

private _seekerTargetPos = _cameraNamespace getVariable [QGVAR(seekerTargetPos), [0, 0, 0]];
private _seekerTargetInfo = _cameraNamespace getVariable [QGVAR(seekerTargetInfo), [false, [0, 0], [0, 0]]];

private _seekerPositionScreen = [0, 0];
private _locked = false;

if (_seekerTargetPos isEqualTo [0, 0, 0]) then {
    {
        _x ctrlShow false;
    } forEach (_cameraNamespace getVariable QGVAR(appearOnLock));
    {
        _x ctrlShow true;
    } forEach (_cameraNamespace getVariable QGVAR(disappearOnLock));
} else {
    // seeker has target - enable relevant data
    _locked = true;
    {
        _x ctrlShow true;
    } forEach (_cameraNamespace getVariable QGVAR(appearOnLock));
    {
        _x ctrlShow false;
    } forEach (_cameraNamespace getVariable QGVAR(disappearOnLock));

    if (_reticleMovesWithTrack) then {
        _seekerPositionScreen = worldToScreen ASLToAGL _seekerTargetPos;
        if (_seekerPositionScreen isEqualTo []) then {
            _seekerPositionScreen = [0, 0];
        };
        _seekerPositionScreen set [0, _seekerPositionScreen#0 - 0.5];
        _seekerPositionScreen set [1, _seekerPositionScreen#1 - 0.5];
    };
};

if (_seekerPositionScreen isEqualTo []) then {
    _seekerPositionScreen = [0, 0];
};

(_cameraNamespace getVariable QGVAR(reticleCenter)) ctrlSetPosition _seekerPositionScreen;

if (_locked) then {
    _seekerTargetInfo params ["_lockedObject", "_boundsTL", "_boundsBR"];
    if (_lockedObject) then {
        private _missile = _cameraNamespace getVariable QGVAR(missile);

        private _avgDistance = (_boundsTL#1 + _boundsBR#1) / 2;

        private _topCenter      = [((_boundsTL#0) + (_boundsBR#0)) / 2, _avgDistance, _boundsBR#2];
        private _bottomCenter   = [((_boundsTL#0) + (_boundsBR#0)) / 2, _avgDistance, _boundsTL#2];
        private _leftCenter     = [_boundsTL#0, _avgDistance, ((_boundsTL#2) + (_boundsBR#2)) / 2];
        private _rightCenter    = [_boundsBR#0, _avgDistance, ((_boundsTL#2) + (_boundsBR#2)) / 2];

        private _ctrlPos = worldToScreen (_missile modelToWorldVisual _leftCenter);
        if (_ctrlPos isEqualTo []) then {
            _ctrlPos set [0, 0.5];
            _ctrlPos set [1, 0.5];
        };
        (_cameraNamespace getVariable QGVAR(reticleLeft)) ctrlSetPosition [(_ctrlPos#0 - _seekerPositionScreen#0) - 0.5, (_ctrlPos#1 - _seekerPositionScreen#1) - 0.5];

        _ctrlPos = worldToScreen (_missile modelToWorldVisual _rightCenter);
        if (_ctrlPos isEqualTo []) then {
            _ctrlPos set [0, 0.5];
            _ctrlPos set [1, 0.5];
        };
        (_cameraNamespace getVariable QGVAR(reticleRight)) ctrlSetPosition [(_ctrlPos#0 - _seekerPositionScreen#0) - 0.5, (_ctrlPos#1 - _seekerPositionScreen#1) - 0.5];

        _ctrlPos = worldToScreen (_missile modelToWorldVisual _topCenter);
        if (_ctrlPos isEqualTo []) then {
            _ctrlPos set [0, 0.5];
            _ctrlPos set [1, 0.5];
        };
        (_cameraNamespace getVariable QGVAR(reticleTop)) ctrlSetPosition [(_ctrlPos#0 - _seekerPositionScreen#0) - 0.5, (_ctrlPos#1 - _seekerPositionScreen#1) - 0.5];

        _ctrlPos = worldToScreen (_missile modelToWorldVisual _bottomCenter);
        if (_ctrlPos isEqualTo []) then {
            _ctrlPos set [0, 0.5];
            _ctrlPos set [1, 0.5];
        };
        (_cameraNamespace getVariable QGVAR(reticleBottom)) ctrlSetPosition [(_ctrlPos#0 - _seekerPositionScreen#0) - 0.5, (_ctrlPos#1 - _seekerPositionScreen#1) - 0.5];
    };
};

{ _x ctrlCommit 0 } forEach [_cameraNamespace getVariable QGVAR(reticleCenter), _cameraNamespace getVariable QGVAR(reticleLeft), _cameraNamespace getVariable QGVAR(reticleRight), _cameraNamespace getVariable QGVAR(reticleTop), _cameraNamespace getVariable QGVAR(reticleBottom)];
