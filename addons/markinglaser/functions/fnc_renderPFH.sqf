#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Renders all marking lasers.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_markinglaser_fnc_renderPFH
 *
 * Public: No
 */

if (GVAR(lasers) isEqualTo []) exitWith {};

#ifndef DEBUG_MODE_FULL
private _controlledUnit = [ACE_player, ACE_controlledUAV#1] select unitIsUAV cameraOn;
if (currentVisionMode _controlledUnit != 1) exitWith {
    { _x hideObject true } forEach GVAR(lasers);
};
#endif

{
    private _laser = _x;
    private _aircraft = _laser getVariable QGVAR(aircraft);
    private _gimbalLimits = _aircraft getVariable [QGVAR(gimbalLimits), []];

    // Get laser direction vector
    private _vector = if (_aircraft getVariable QGVAR(useTurret)) then {
        [_aircraft, _laser] call FUNC(getTurretVector)
    } else {
        [_aircraft, _laser] call FUNC(getPilotCamVector)
    };

    // Turn off laser if gimbal limit is reached
    // 0.1 is added to calculated values, seems to be slightly inaccurate
    _gimbalLimits params ["_minDir", "_maxDir", "_minElev", "_maxElev"];
    private _modelVector = _aircraft vectorWorldToModelVisual _vector;
    private _dir = _modelVector#0 atan2 _modelVector#1;
    if (_dir < _minDir - 0.1 || {_dir > _maxDir + 0.1}) then {
        _laser hideObject true;
        continue;
    };

    private _elevation = _modelVector#2 atan2 vectorMagnitude [_modelVector#0, _modelVector#1, 0];
    if (_elevation < _minElev - 0.1 || {_elevation > _maxElev + 0.1}) then {
        _laser hideObject true;
        continue;
    };

    private _originWorld = [0, 0, 0];
    private _originVisual = [0, 0, 0];
    if (_aircraft == cameraOn && {cameraView == "GUNNER"}) then {
        // Add offset when looking through camera
        // Otherwise, laser will appear invisible because camera is inside of laser
        _originWorld = AGLToASL positionCameraToWorld [0.5, -0.5, 0];
        _originVisual = _originWorld;
    } else {
        private _originPoint = _aircraft getVariable [QGVAR(laserOrigin), ""];
        _originWorld = _aircraft modelToWorldVisualWorld (_aircraft selectionPosition _originPoint);
        _originVisual = _originWorld vectorAdd (_vector vectorMultiply -0.25);
    };

    // Update laser direction
    _laser setVectorUp _vector;

    // Let laser clip into turret - camera position is often sightly in front of turret
    _laser setPosASL _originVisual;

    // Unhide laser in case NVGs were turned off
    _laser hideObject false;

    // Check if laser hits object or ground
    // Add small offset to avoid intersection with turret
    private _startPos = _originWorld vectorAdd (_vector vectorMultiply 0.25);
    private _endPos = _startPos vectorAdd (_vector vectorMultiply LIS_LIMIT);
    private _intersects = lineIntersectsSurfaces [_startPos, _endPos, _laser];

    // Circumvent 5 km limit of lineIntersectsSurfaces:
    // If no intersection was found, check between 5 km and 10 km
    if (_intersects isEqualTo []) then {
        private _startPos = _endPos;
        _endPos = _endPos vectorAdd (_vector vectorMultiply LIS_LIMIT);
        _intersects = lineIntersectsSurfaces [_startPos, _endPos, _laser];
    };

    // Adjust length of laser so it doesn't go through objects
    if (_intersects isEqualTo []) then {
        // 0 = maximum length, likely to just point into the sky
        _laser animateSource ["adjustLength", 0, true];
    } else {
        // Add 1 m to account for offsets
        private _distance = _originVisual vectorDistance _intersects#0#0;
        _laser animateSource ["adjustLength", _distance - LASER_MAX, true];
    };

    // Add random flickering, about once per second
    _laser setObjectTexture [0, selectRandomWeighted [
        "#(rgb,8,8,3)color(1,1,1,1,co)", diag_fps - 2,
        "#(rgb,8,8,3)color(1,1,0,1,co)", 1,
        "#(rgb,8,8,3)color(1,0,0,1,co)", 1
    ]];
} forEach GVAR(lasers);
