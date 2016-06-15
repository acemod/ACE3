/*
 * Author: BaerMitUmlaut
 * Scans the area in front of the aircraft by radar.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: The direction of the scanning cone <ARRAY>
 * 2: The horizontal angle (in deg) of the scanning cone
 * 3: The vertical angle (in deg) of the scanning cone
 *
 * Return Value:
 * Detected vehicles <ARRAY>
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_aircraft", "_fromToH", "_fromToV"];
_fromToH params ["_fromH", "_toH"];
_fromToV params ["_fromV", "_toV"];

private _scanConeH = _toH - _fromH;
private _scanConeV = _toH - _fromH;

private _scanVectorH = [vectorDirVisual _aircraft, _fromH + (_scanConeH / 2)] call BIS_fnc_rotateVector2D;
private _scanVectorV = [vectorDirVisual _aircraft, _fromV + (_scanConeV / 2)] call BIS_fnc_rotateVector2D;

private _detectedAircraft = [];

#ifdef DEBUG_MODE_FULL
    private _scanVector = _scanVectorH + _scanVectorV;
    drawLine3D [
        getPosATL _aircraft,
        (getPosATL _aircraft) vectorAdd (_scanVector vectorMultiply 20),
        [1, 0, 0, 1]
    ];
#endif

{
    if (_x != _aircraft && {(getPosATL _x) select 2 > 10}) then {
        private _dirToTarget = (getPosASL _x) vectorDiff (getPosASL _aircraft);

        private _diffRadH = (_dirToTarget select [0, 2]) vectorDotProduct _scanVectorH;
        private _diffDegH = RAD_TO_DEG(_diffRadH);
        private _diffRadV = (_dirToTarget select [1, 2]) vectorDotProduct _scanVectorV;
        private _diffDegV = RAD_TO_DEG(_diffRadV);

        if (_diffDegH <= _scanConeH && {_diffDegV <= _scanConeV}) then {
            _detectedAircraft pushBack _x;
        };
    };

    false
} count GVAR(aircraft);

_detectedAircraft
