/*
 * Author: Ruthberg
 * Calculates the target range and updates the output fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_calculate_target_range_assist
 *
 * Public: No
 */
#include "script_component.hpp"

private _angle = parseNumber(ctrlText 7012);
private _targetSize = abs(parseNumber(ctrlText 7010));
if (GVAR(rangeAssistUseTargetHeight)) then {
    _targetSize = _targetSize * cos(_angle);
};
switch (GVAR(rangeAssistTargetSizeUnit)) do {
    case 0: {
        _targetSize = _targetSize * 0.0254;
    };
    case 1: {
        _targetSize = _targetSize * 0.3048;
    };
    case 2: {
        _targetSize = _targetSize * 0.01;
    };
};
private _imageSize = parseNumber(ctrlText 7011);
switch (GVAR(rangeAssistImageSizeUnit)) do {
    case 0: {
        _imageSize = _imageSize / 6400 * 360;
    };
    case 1: {
        _imageSize = _imageSize / 60;
    };
    case 2: {
        _imageSize = _imageSize / 60 / 1.047;
    };
};
private _estRange = abs(parseNumber(ctrlText 7013));
if (GVAR(currentUnit) == 1) then {
    _estRange = _estRange / 1.0936133;
};

switch (_this) do {
    case 0: {
        _targetSize = tan(_imageSize) * _estRange;

        if (GVAR(rangeAssistUseTargetHeight) && cos(_angle) != 0) then {
            _targetSize = _targetSize / cos(_angle);
        };

        switch (GVAR(rangeAssistTargetSizeUnit)) do {
            case 0: {
                _targetSize = _targetSize / 0.0254;
            };
            case 1: {
                _targetSize = _targetSize / 0.3048;
            };
            case 2: {
                _targetSize = _targetSize / 0.01;
            };
        };

        ctrlSetText [7010, Str(Round(_targetSize * 100) / 100)];
    };
    case 1: {
        if (_estRange > 0) then {
            _imageSize = atan(_targetSize / _estRange);
        };

        switch (GVAR(rangeAssistImageSizeUnit)) do {
            case 0: {
                _imageSize = _imageSize * 6400 / 360;
            };
            case 1: {
                _imageSize = _imageSize * 60;
            };
            case 2: {
                _imageSize = _imageSize * 60 * 1.047;
            };
        };

        ctrlSetText [7011, Str(Round(_imageSize * 100) / 100)];
    };
    case 2: {
        if (tan(_imageSize) != 0) then {
            _estRange = _targetSize / tan(_imageSize);
        };

        ctrlSetText [7013, Str(Round(_estRange))];
    };
};
