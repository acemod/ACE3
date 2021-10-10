#include "script_component.hpp"
/*
 * Author: Nelson Duarte, SilentSpike
 * Moves the spectator camera to a position relative to the camera focus.
 * Used for 3PP camera and teleporting, etc.
 *
 * Arguments:
 * 0: New Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_spectator_fnc_cam_prepareTarget
 *
 * Public: No
 */

private _focus = vehicle (param [0, objNull, [objNull]]);
TRACE_1("cam_prepareTarget",_focus);

if !(isNull _focus) then {
    // Zooming takes place smoothly over multiple frames
    // _zoom is target set by user, _zoomTrue is actual value each frame
    private _zoom = [0, GVAR(camDistance)] select (GVAR(camMode) == MODE_FOLLOW);
    private _zoomTrue = GVAR(camDistanceTrue);

    // Interpolate zoom each frame until desired zoom is reached
    if (_zoomTrue != _zoom) then {
        _zoomTrue = (_zoomTrue * (1 - GVAR(camDeltaTime) * 10)) + (_zoom * GVAR(camDeltaTime) * 10);
        GVAR(camDistanceTrue) = _zoomTrue;
        TRACE_2("new zoom",GVAR(camDeltaTime),_zoomTrue);
    };

    // The distance at which to place camera from the focus pivot
    private _bbd = [_focus] call BIS_fnc_getObjectBBD;
    private _distance = (_bbd select 1) + _zoomTrue;

    // The pivot on the target vehicle
    private _isMan = _focus isKindOf "Man";
    private _height = if !(_isMan) then { (_bbd select 2) / 3 } else { switch (stance _focus) do { case "STAND": {1.4}; case "CROUCH": {0.8}; default {0.4}; }; };

    private _center = if (_isMan) then { _focus modelToWorldVisualWorld (_focus selectionPosition "Spine3") } else { _focus modelToWorldVisualWorld [0,0,_height] };

    // Set dummy location and rotation
    private _dummy = GVAR(camDummy);

    _dummy setPosASL _center;
    [_dummy, [GVAR(camYaw), GVAR(camPitch), 0]] call BIS_fnc_setObjectRotation;

    // Apply location and rotation to camera
    GVAR(camera) setPosASL (_dummy modelToWorldVisualWorld [0, -_distance, 0]);
    GVAR(camera) setVectorDirAndUp [vectorDirVisual _dummy, vectorUpVisual _dummy];
};
