
#include "script_component.hpp"
TRACE_1("Params",_this);

private _focus = vehicle (param [0, objNull, [objNull]]);

if !(isNull _focus) then {
    private _deltaTime = GVAR(deltaTime);
    private _camera = GVAR(camera);
    private _cameraMode = GVAR(camMode);
    private _dummy = GVAR(camDummy);
    private _zoom = if (_cameraMode == MODE_FOLLOW) then { GVAR(camDistance) } else { 0 };
    private _zoomTemp = GETMVAR(GVAR(camDistanceTemp),0);
    private _isMan = _focus isKindOf "Man";
    private _bbd = [_focus] call BIS_fnc_getObjectBBD;
    private _height = if !(_isMan) then { (_bbd select 2) / 3.0 } else { switch (stance _focus) do { case "STAND": {1.4}; case "CROUCH": {0.8}; default {0.4}; }; };

    // Interpolate zoom
    if (_zoomTemp != _zoom) then {
        _zoomTemp = [_zoomTemp, _zoom, 10.0, _deltaTime] call BIS_fnc_lerp;
        GVAR(camDistanceTemp) = _zoomTemp;
    };

    // The distance at which to place camera from the focus pivot
    private _distance = (_bbd select 1) + _zoomTemp;

    // The pivot on the target vehicle
    private _center = if (_isMan) then { AGLToASL (_focus modelToWorldVisual (_focus selectionPosition "Spine3")) } else { AGLToASL (_focus modelToWorldVisual [0,0,_height]) };

    // The camera pitch and yaw
    private _cameraYaw = GVAR(camYaw);
    private _cameraPitch = GVAR(camPitch);

    // Set dummy location and rotation
    _dummy setPosASL _center;
    [_dummy, [_cameraYaw, _cameraPitch, 0]] call BIS_fnc_setObjectRotation;

    // Apply location and rotation to camera
    _camera setPosASL (AGLToASL (_dummy modelToWorldVisual [0, -_distance, 0]));
    _camera setVectorDirAndUp [vectorDirVisual _dummy, vectorUpVisual _dummy];
};
