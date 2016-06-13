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
params ["_aircraft", "_scanVector", "_scanConeH", "_scanConeV"];

private _scanVectorH = _scanVector select [0, 2]; //[x, y]
private _scanVectorV = _scanVector select [1, 2]; //[y, z]
private _detectedAircraft = [];

{
    if ((getPosATL _x) select 2 > 10) then {
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
