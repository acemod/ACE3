/*
Name: AGM_Artillery_fnc_dev_buildTable

Author: Pabst Mirror

Description:
  DEV function to build mortar tables, very cpu intensive (never used durring normal gameplay)

Parameters: (normal BIS "Fired" EH stuff)
  0: NUMBER - Muzzle Velocity
  1: NUMBER - Air Friction

Returns:
  Data in clipboard

Example:
  [100, -0.0001] spawn AGM_Artillery_fnc_dev_buildTable; //spawn (scheduled) is slower
  [100, -0.0001] call AGM_Artillery_fnc_dev_buildTable; //faster, but will lock while processing
*/
#include "script_component.hpp"

private ["_muzzleVelocity", "_airFriction", "_stillInRange", "_currentRange", "_increasePerRow", "_outputArray", "_rangeToHit", "_lineElevation", "_lineHeightElevation", "_lineTimeOfFlight", "_lineCrosswindDeg", "_lineHeadwindMeters", "_lineTailWindMeters", "_lineTempDec", "_lineTempInc", "_lineAirDensDec", "_lineAirDensInc", "_result", "_outputString"];

_muzzleVelocity = _this select 0;
_airFriction = _this select 1;
_stillInRange = true;
_currentRange = 100;
_increasePerRow = 50;
_outputArray = [];


//[_rangeToHit, _lineElevation, _lineHeightElevation, _lineTimeOfFlight, _lineCrosswindDeg, _lineHeadwindMeters, _lineTailWindMeters, _lineTempDec, _lineTempInc, _lineAirDensDec, _lineAirDensInc]

while {_stillInRange} do {
  _result = [_muzzleVelocity, _currentRange, _airFriction] call FUNC(dev_simulateCalcRangeTableLine);
  if (_result isEqualTo []) then {
    _stillInRange = false;
  } else {
    if ((_result select 1) < 86) then {
      _outputArray pushBack [
      ([(_result select 0),  "meters", false] call FUNC(dev_formatNumber)),
      ([(_result select 1),  "mil", true] call FUNC(dev_formatNumber)),
      ([(_result select 2),  "mil", true] call FUNC(dev_formatNumber)),
      ([(_result select 3),  "sec", false] call FUNC(dev_formatNumber)),
      ([(_result select 4),  "milPrecise", true] call FUNC(dev_formatNumber)),
      ([(_result select 5),  "metersprecise", false] call FUNC(dev_formatNumber)),
      ([(_result select 6),  "metersprecise", false] call FUNC(dev_formatNumber)),
      ([(_result select 7),  "metersprecise", false] call FUNC(dev_formatNumber)),
      ([(_result select 8),  "metersprecise", false] call FUNC(dev_formatNumber)),
      ([(_result select 9),  "metersprecise", false] call FUNC(dev_formatNumber)),
      ([(_result select 10), "metersprecise", false] call FUNC(dev_formatNumber))
      ];
    };
    _currentRange = _currentRange + _increasePerRow;
  };
  hint str _currentRange;
};

//handle floating point rounding errors
_outputString = format ["case ((abs(_muzzleVelocity - %1) < 0.00001) && ((abs(_airFriction - %2) < 0.00001))): {
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

hint "done";