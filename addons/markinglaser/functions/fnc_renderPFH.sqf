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
if (currentVisionMode _controlledUnit != 1) exitWith {};
#endif

{
    private _aircraft = _x;
    private _gimbalLimits = _aircraft getVariable [QGVAR(gimbalLimits), []];

    // Get laser direction vector
    private _vector = if (_aircraft getVariable QGVAR(useTurret)) then {
        [_aircraft] call FUNC(getTurretVector)
    } else {
        [_aircraft] call FUNC(getPilotCamVector)
    };

    // Turn off laser if gimbal limit is reached
    // 0.1 is added to calculated values, seems to be slightly inaccurate
    _gimbalLimits params ["_minDir", "_maxDir", "_minElev", "_maxElev"];
    private _modelVector = _aircraft vectorWorldToModelVisual _vector;
    private _dir = _modelVector#0 atan2 _modelVector#1;
    if (_dir < _minDir - 0.1 || {_dir > _maxDir + 0.1}) then {
        continue;
    };

    private _elevation = _modelVector#2 atan2 vectorMagnitude [_modelVector#0, _modelVector#1, 0];
    if (_elevation < _minElev - 0.1 || {_elevation > _maxElev + 0.1}) then {
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

    // Draw laser
    drawLaser [
        _originVisual,
        _vector,
        [1, 0, 0, 1],
        [],
        5,
        20,
        -1,
        true
    ];
} forEach GVAR(lasers);
