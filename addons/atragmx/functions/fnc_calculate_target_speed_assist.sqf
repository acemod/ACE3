/*
 * Author: Ruthberg
 * Calculates the target speed and updates the output fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_calculate_target_speed_assist
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_targetRange", "_numTicks", "_timeSecs", "_estSpeed"];

_targetRange = parseNumber(ctrlText 8004);
_numTicks = parseNumber(ctrlText 8005);
_timeSecs = parseNumber(ctrlText 8006);
_estSpeed = 0;

if (GVAR(currentUnit) == 1) then {
    _targetRange = _targetRange / 1.0936133;
};

switch (GVAR(rangeAssistImageSizeUnit)) do {
    case 0: {
        _numTicks = _numTicks / 6400 * 360;
    };
    case 1: {
        _numTicks = _numTicks / 60;
    };
    case 2: {
        _numTicks = _numTicks / 60 / 1.047;
    };
};

if (_timeSecs > 0) then {
    _estSpeed = tan(_numTicks) * _targetRange / _timeSecs;
};

if (GVAR(currentUnit) != 2) then {
    _estSpeed = _estSpeed * 2.23693629;
};

ctrlSetText [8007, Str(Round(_estSpeed * 10) / 10)];
