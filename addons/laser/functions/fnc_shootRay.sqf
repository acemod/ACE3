#include "script_component.hpp"

BEGIN_COUNTER(shootRay);

params ["_posASL", "_dir", ["_ignoreVehicle1", objNull], ["_ignoreVehicle2", objNull]];
// TRACE_2("ray origin:", _posASL, _dir);

private _distance = 0;
private _resultPos = nil;

private _farPoint = _posASL vectorAdd (_dir vectorMultiply 10000);
private _return = lineIntersectsSurfaces [_posASL, _farPoint, _ignoreVehicle1, _ignoreVehicle2];

if (!(_return isEqualTo [])) then {
    (_return select 0) params ["_intersectPosASL", "", "_intersectObject"];
     // Move back slightly to prevents issues with it going below terrain
    _distance = (_posASL vectorDistance _intersectPosASL) - 0.005;
    _resultPos = _posASL vectorAdd (_dir vectorMultiply _distance);
};

// TRACE_2("ray result:", _resultPos, _distance);

#ifdef DEBUG_MODE_FULL
if !(isNil "_resultPos") then {
    private _text = [_distance, 4, 0] call CBA_fnc_formatNumber;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0, 1, 0, 1], ASLtoAGL _resultPos, 0.75, 0.75, 0, _text, 0.5, 0.025, "TahomaB"];
};
#endif

END_COUNTER(shootRay);
[_resultPos, _distance];
