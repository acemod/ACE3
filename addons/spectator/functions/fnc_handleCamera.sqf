/*
 * Author: F3 Project, Head, SilentSpike
 * Handles free camera manipulation according to input
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleCamera, 0] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

// Kill PFH when not in free cam (or display is closed)
if (isNil QGVAR(camHandler)) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

private ["_camera","_pan","_tilt"];

_pan = (GVAR(camPan) + 360) % 360;
_tilt = GVAR(camTilt);

if (GVAR(camMode) == 0) then {
    private ["_oldPos","_altMod","_zoomMod","_mX","_mY","_mZ","_x","_y","_z"];
    _camera = GVAR(freeCamera);
    _oldPos = GVAR(camPos);

    // Dolly/Boom amount should be influnced by zoom level (it should really be exponential)
    // Dollying should also slow as the camera gets close to the ground
    _zoomMod = (GVAR(camZoom) * 0.8) max 1;
    _altMod = ((((getPos _camera) select 2) * 0.05) max 0.1) min 1;

    _mX = (GVAR(camDolly) select 0) * _altMod / _zoomMod;
    _mY = (GVAR(camDolly) select 1) * _altMod / _zoomMod;
    _mZ = GVAR(camBoom) / _zoomMod;

    _x = (_oldPos select 0) + (_mX * cos(_pan)) + (_mY * sin(_pan));
    _y = (_oldPos select 1) - (_mX * sin(_pan)) + (_mY * cos(_pan));
    _z = (_oldPos select 2) + _mZ;

    // Prevent camera going under terrain
    GVAR(camPos) = [_x,_y,_z max (getTerrainHeightASL [_x,_y])];

    // Update camera position and rotation
    _camera setPosASL GVAR(camPos);
    _camera setDir _pan;
    [_camera, _tilt, 0] call BIS_fnc_setPitchBank;
} else {
    private ["_unit","_target","_distance","_vector"];
    _camera = GVAR(unitCamera);

    _unit = GVAR(camUnit);
    _target = GVAR(targetCamera);
    _distance = GVAR(camDistance);

    // Generate a position vector relative to the unit
    _vector = [0,-_distance*cos(_tilt),0];
    _vector = [_vector,[-_pan] call CBA_fnc_simplifyAngle180] call BIS_fnc_rotateVector2D;
    _vector = _vector vectorAdd [0,0,_distance*sin(-_tilt)];

    // Update the position of the target camera (used for smooth unit tracking)
    _target camSetPos ((ASLToAGL getPosASLVisual _unit) vectorAdd [0,0,1.5]);
    _target camCommit 0;

    // Update the relative position of the unit camera
    _camera camSetRelPos _vector;
    _camera camCommit 0;

    GVAR(camPos) = getPosASL _camera;
};
