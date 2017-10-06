/*
 * Author: PabstMirror
 * DEV function to build mortar tables, very cpu intensive (never used durring normal gameplay)
 *
 * Arguments:
 * 0: Muzzle Velocity <NUMBER>
 * 1: Air Friction <NUMBER>
 *
 * Return Value:
 * None <Data in clipboard>
 *
 * Example:
 * [100, -0.0001] spawn ace_mk6mortar_fnc_dev_buildTable; //spawn (scheduled) is slower
 * [100, -0.0001] call ace_mk6mortar_fnc_dev_buildTable; //faster, but will lock while processing
 *
 * Public: No
 */
#include "script_component.hpp"

private _muzzleVelocity = _this select 0;
private _airFriction = _this select 1;
private _stillInRange = true;
private _currentRange = 100;
private _increasePerRow = 50;
private _outputArray = [];


//[_rangeToHit, _lineElevation, _lineHeightElevation, _lineHeightTimeDelta, _lineTimeOfFlight, _lineCrosswindDeg, _lineHeadwindMeters, _lineTailWindMeters, _lineTempDec, _lineTempInc, _lineAirDensDec, _lineAirDensInc]

while {_stillInRange} do {
    private _result = [_muzzleVelocity, _currentRange, _airFriction] call FUNC(dev_simulateCalcRangeTableLine);
    if (_result isEqualTo []) then {
        _stillInRange = false;
    } else {
        if (_airFriction == 0) then {
            _result set [5, 0];
            _result set [6, 0];
            _result set [7, 0];
            _result set [8, 0];
            _result set [9, 0];
            _result set [10, 0];
            _result set [11, 0];
        };
        if ((_result select 1) < 88) then {
            _outputArray pushBack [
            ([(_result select 0),  "meters", false] call FUNC(dev_formatNumber)),
            ([(_result select 1),  "mil", true] call FUNC(dev_formatNumber)),
            ([(_result select 2),  "mil", true] call FUNC(dev_formatNumber)),
            ([(_result select 3),  "sec", false] call FUNC(dev_formatNumber)),
            ([(_result select 4),  "sec", false] call FUNC(dev_formatNumber)),
            ([(_result select 5),  "milPrecise", true] call FUNC(dev_formatNumber)),
            ([(_result select 6),  "metersprecise", false] call FUNC(dev_formatNumber)),
            ([(_result select 7),  "metersprecise", false] call FUNC(dev_formatNumber)),
            ([(_result select 8),  "metersprecise", false] call FUNC(dev_formatNumber)),
            ([(_result select 9),  "metersprecise", false] call FUNC(dev_formatNumber)),
            ([(_result select 10),  "metersprecise", false] call FUNC(dev_formatNumber)),
            ([(_result select 11), "metersprecise", false] call FUNC(dev_formatNumber))
            ];
        };
        _currentRange = _currentRange + _increasePerRow;
    };
    hintSilent str _currentRange;
};

//handle floating point rounding errors
private _outputString = format ["case ((abs(_muzzleVelocity - %1) < 0.00001) && {(abs(_airFriction - %2) < 0.00001)}): {
[
", _muzzleVelocity, _airFriction];

{
    if (_forEachIndex < ((count _outputArray) - 1)) then {
        _outputString = _outputString + format ["%1,
    ", _x];
    } else {
        _outputString = _outputString + format ["%1
    ]
    };", _x];
    };
} forEach _outputArray;

copyToClipboard _outputString;
rangeTableOutput = _outputString;

hint "done";
