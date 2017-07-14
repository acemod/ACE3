/*
 * Author: Nou, PabstMirror
 * Shoots a ray from a source to a direction and finds first intersction and distance
 *
 * Arguments:
 * 0: Origin position ASL <ARRAY>
 * 1: Direction (normalized) <ARRAY>
 * 2: Ignore 1 (e.g. Player's vehicle) <OPTIONAL><OBJECT>
 * 2: Ignore 2 (e.g. Player's vehicle) <OPTIONAL><OBJECT>
 *
 * Return Value:
 * [posASL, distance] - pos will be nil if no intersection <ARRAY>
 *
 * Example:
 * [getPosASL player, [0,1,0], player] call ace_laser_fnc_shootRay;
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(shootRay);

params ["_posASL", "_dir", ["_ignoreVehicle1", objNull], ["_ignoreVehicle2", objNull]];
// TRACE_2("ray origin:", _posASL, _dir);

private _distance = 0;
private _resultPos = nil;

private _farPoint = _posASL vectorAdd (_dir vectorMultiply 10000);
private _intersects = lineIntersectsSurfaces [_posASL, _farPoint, _ignoreVehicle1, _ignoreVehicle2];
// workaround for lineIntersectsSurfaces using a hardcoded max distance of 5000m. New max distance 15000m
if (_intersects isEqualTo []) then {
    _intersects = lineIntersectsSurfaces [_posASL vectorAdd (_dir vectorMultiply 5000), _farPoint vectorAdd (_dir vectorMultiply 5000), _ignoreVehicle1, _ignoreVehicle2];
    if (_intersects isEqualTo []) then {
        _intersects = lineIntersectsSurfaces [_posASL vectorAdd (_dir vectorMultiply 10000), _farPoint vectorAdd (_dir vectorMultiply 10000), _ignoreVehicle1, _ignoreVehicle2];
    };
};

if (!(_intersects isEqualTo [])) then {
    (_intersects select 0) params ["_intersectPosASL", "", "_intersectObject"];
    // Move back slightly to prevents issues with it going below terrain
    _distance = (_posASL vectorDistance _intersectPosASL) - 0.005;
    _resultPos = _posASL vectorAdd (_dir vectorMultiply _distance);
};

TRACE_3("", _resultPos, _distance, _intersects);

#ifdef DRAW_LASER_INFO
if !(isNil "_resultPos") then {
    private _text = [_distance, 4, 0] call CBA_fnc_formatNumber;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0, 1, 0, 1], ASLtoAGL _resultPos, 0.5, 0.5, 0, _text, 0.4, 0.025, "TahomaB"];
    drawLine3D [ASLtoAGL _posASL, ASLtoAGL _resultPos, [0,1,0,1]];
};
#endif

END_COUNTER(shootRay);
[_resultPos, _distance];
