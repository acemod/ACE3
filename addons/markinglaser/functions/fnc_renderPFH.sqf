#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror
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

if (((currentVisionMode focusOn) != 1) || {EGVAR(laser,laserEmitters) isEqualTo []}) exitWith {
    GVAR(pfEH) call CBA_fnc_removePerFrameHandler;
    GVAR(pfEH) = -1;
    TRACE_1("end PFEH",GVAR(pfEH));
};

{
    _y params ["_aircraft", "", "_laserMethod"];

    private _currentMode = _aircraft getVariable [QGVAR(laserMode), MODE_OFF];
    if (_currentMode == MODE_OFF) then { continue };
    if (_laserMethod != QEFUNC(laser,findLaserSource)) then { continue }; // Normal vanilla laserTarget func

    if ((_currentMode == MODE_FLASH) && {
        private _cycle = (CBA_missionTime + (_aircraft getVariable [QGVAR(flashOffset), 0])) % (1/3);
        _cycle > 1/6
    }) then { continue };

    private _laser = _y call EFUNC(laser,findLaserSource);
    if ((_laser isEqualTo []) || {_laser isEqualTo [-1, -1]}) then { continue };
    _laser params ["_laserPosASL", "_laserDir"];

    #ifdef DEBUG_MODE_FULL
    private _targetObject = _aircraft getVariable [QEGVAR(laser,targetObject), objNull];
    private _targetPosASL = getPosASL _targetObject;

    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (ASLToAGL _targetPosASL), 0.5, 0.5, 0, "Laser", 0.5, 0.025, "TahomaB"];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (ASLToAGL _laserPosASL), 0.5, 0.5, 0, "Origin", 0.5, 0.025, "TahomaB"];
    #endif

    // If our camera is the laser source, offset it just a bit so it isn't dead center
    if (((AGLToASL positionCameraToWorld [0,0,0]) distance _laserPosASL) < 0.09) then {
        _laserPosASL = AGLToASL positionCameraToWorld [-0.02, -0.05, 0];
    };

    private _smoothing = _aircraft getVariable [QGVAR(smoothing), []];
    _smoothing pushBack _laserDir;
    if (count _smoothing > 5) then { _smoothing deleteAt 0 };
    private _smoothDir = [0,0,0];
    { _smoothDir = _smoothDir vectorAdd _x } forEach _smoothing;
    _smoothDir = _smoothDir vectorMultiply (1/count _smoothing);

    private _startPos = _laserPosASL vectorAdd (_smoothDir vectorMultiply 0.25); // go forward a bit so first drawLaser doesn't hit aircraft
    private _endPos = _laserPosASL vectorAdd (_smoothDir vectorMultiply LASER_MAX);
    private _intersects = [];
    while { _intersects isEqualTo [] } do {
        // drawLaser has an internal maximum distance it can draw, so we may need to draw multiple segments
        drawLaser [_startPos, _smoothDir, [250, 0, 0, 1], [], 0, 1, LASER_MAX, true]; // Draw a segment
        if ((_startPos distance _laserPosASL) > 9999) exitWith {}; // just exit loop if we've drawn far enough
        _intersects = lineIntersectsSurfaces [_startPos, _endPos, _aircraft];
        if (_intersects isEqualTo []) then { // Check if we hit anything
            _startPos = _endPos; // if we didn't then move up the startpos to where the last draw ended
            _endPos = _endPos vectorAdd (_smoothDir vectorMultiply LASER_MAX);
        };
    };
    drawLaser [_laserPosASL, _smoothDir, [250, 0, 0, 1], [], 0.5, 1, LASER_MAX, true]; // final draw from actual origin 
} forEach EGVAR(laser,laserEmitters);
