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

private ["_camera","_oldPos","_altMod","_zoomMod","_mX","_mY","_mZ","_pan","_x","_y","_z"];

_camera = GVAR(camera);
_oldPos = getPosASL _camera;

// Dolly/Boom amount should be influnced by zoom level (it should really be exponential)
// Dollying should also slow as the camera gets close to the ground
_zoomMod = (GVAR(camZoom) * 0.8) max 1;
_altMod = ((((getPos _camera) select 2) * 0.05) max 0.1) min 1;

_mX = (GVAR(camDolly) select 0) * _altMod / _zoomMod;
_mY = (GVAR(camDolly) select 1) * _altMod / _zoomMod;
_mZ = GVAR(camBoom) / _zoomMod;

_pan = (GVAR(camPan) + 360) % 360;
_x = (_oldPos select 0) + (_mX * cos(_pan)) + (_mY * sin(_pan));
_y = (_oldPos select 1) - (_mX * sin(_pan)) + (_mY * cos(_pan));
_z = (_oldPos select 2) + _mZ;

// Prevent camera going under terrain
GVAR(camPos) = [_x,_y,_z max (getTerrainHeightASL [_x,_y])];

// Update camera position and rotation
_camera setPosASL GVAR(camPos);
_camera setDir GVAR(camPan);
[_camera, GVAR(camTilt), 0] call BIS_fnc_setPitchBank;
