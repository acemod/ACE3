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
    TRACE_1("end PFEH", GVAR(pfEH));
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

    private _targetObject = _aircraft getVariable [QEGVAR(laser,targetObject), objNull];
    private _targetPosASL = getPosASL _targetObject;

    (_y call EFUNC(laser,findLaserSource)) params ["_laserPosASL", "_laserDir"];

    #ifdef DEBUG_MODE_FULL
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (ASLToAGL _targetPosASL), 0.5, 0.5, 0, "Laser", 0.5, 0.025, "TahomaB"];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (ASLToAGL _laserPosASL), 0.5, 0.5, 0, "Origin", 0.5, 0.025, "TahomaB"];
    #endif

    private _smoothing = _aircraft getVariable [QGVAR(smoothing), []];
    _smoothing pushBack _laserDir;
    if (count _smoothing > 5) then { _smoothing deleteAt 0 };
    private _smoothDir = [0,0,0];
    { _smoothDir = _smoothDir vectorAdd _x } forEach _smoothing;
    _smoothDir = _smoothDir vectorMultiply (1/count _smoothing);

    private _startPos = _laserPosASL vectorAdd (_smoothDir vectorMultiply 0.25);
    private _endPos = _laserPosASL vectorAdd (_smoothDir vectorMultiply LASER_MAX);
    private _intersects = [];
    while { _intersects isEqualTo [] } do {
        drawLaser [_startPos, _smoothDir, [250, 0, 0, 1], [], 0, 1, LASER_MAX, true];
        // Circumvent limit of drawLaser
        if ((_startPos distance _laserPosASL) > 9999) exitWith {};
        _intersects = lineIntersectsSurfaces [_startPos, _endPos, _aircraft];
        if (_intersects isEqualTo []) then {
            _startPos = _endPos;
            _endPos = _endPos vectorAdd (_smoothDir vectorMultiply LASER_MAX);
        };
    };
    drawLaser [_laserPosASL, _smoothDir, [250, 0, 0, 1], [], 0.5, 1, LASER_MAX, true];
} forEach EGVAR(laser,laserEmitters);
