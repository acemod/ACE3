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
if (currentVisionMode _controlledUnit != 1 && {
    (!isNull curatorCamera) && {
        (_curator getVariable ["BIS_fnc_curatorVisionModes_current", 0]) != 0
    }
}) exitWith {};
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

    private _origin = [0, 0, 0];
    if (_aircraft == cameraOn && {cameraView == "GUNNER"}) then {
        _origin = AGLToASL positionCameraToWorld [0, 0, 0];
    } else {
        private _originPoint = _aircraft getVariable [QGVAR(laserOrigin), ""];
        _origin = _aircraft modelToWorldVisualWorld (_aircraft selectionPosition _originPoint);
    };

    // Check if laser hits object or ground
    private _startPos = _origin vectorAdd (_vector vectorMultiply 0.25);
    private _endPos = _startPos vectorAdd (_vector vectorMultiply LASER_MAX);
    private _intersects = [];
    while { _intersects isEqualTo [] } do {
        _intersects = lineIntersectsSurfaces [_startPos, _endPos, _aircraft];
        drawLaser [
            +_startPos,
            _vector,
            [250, 0, 0, 1],
            [],
            0,
            1,
            LASER_MAX,
            true
        ];
        // Circumvent limit of drawLaser
        if (_intersects isEqualTo []) then {
            _startPos = _endPos;
            _endPos = _endPos vectorAdd (_vector vectorMultiply LASER_MAX);
        };
    };
    drawLaser [
        _startPos,
        _vector,
        [250, 0, 0, 1],
        [],
        0.5,
        1,
        LASER_MAX,
        true
    ];
} forEach GVAR(lasers);
