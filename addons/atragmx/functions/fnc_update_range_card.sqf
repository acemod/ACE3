/*
 * Author: Ruthberg
 * Updates the range card listbox content
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_range_card
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_range", "_elevation", "_windage1", "_windage2", "_clickSize", "_clickNumber", "_clickInterval", "_lead", "_TOF", "_velocity", "_kineticEnergy", "_rangeOutput", "_elevationOutput", "_windageOutput", "_lastColumnOutput", "_speedOfSound"];
_lastColumnOutput = "";

if (GVAR(showWind2) && GVAR(rangeCardCurrentColumn) == 0) then {
    ctrlSetText [5006, "Wind2"];
} else {
    ctrlSetText [5006, (GVAR(rangeCardLastColumns) select GVAR(rangeCardCurrentColumn))];
};

if (GVAR(currentUnit) == 1) then {
    ctrlSetText [5003, "Yards"];
} else {
    ctrlSetText [5003, "Meters"];
};

lnbClear 5007;

_speedOfSound = GVAR(temperature) call EFUNC(weather,calculateSpeedOfSound);

{
    _range = _x select 0;
    _elevation = _x select 1;
    _windage1 = (_x select 2) select 0;
    _windage2 = (_x select 2) select 1;
    _lead = _x select 3;
    _TOF =  _x select 4;
    _velocity = _x select 5;
    _kineticEnergy = _x select 6;

    switch (GVAR(currentScopeUnit)) do {
        case 0: {
            _elevation = _elevation / 3.38;
            _windage1 = _windage1 / 3.38;
            _windage2 = _windage2 / 3.38;
        };
        case 2: {
            _elevation = _elevation * 1.047;
            _windage1 = _windage1 * 1.047;
            _windage2 = _windage2 * 1.047;
        };
        case 3: {
            switch (GVAR(workingMemory) select 7) do {
                case 0: { _clickSize = 1; };
                case 1: { _clickSize = 1 / 1.047; };
                case 2: { _clickSize = 3.38; };
            };
            _clickNumber = GVAR(workingMemory) select 8;
            _clickInterval = _clickSize / _clickNumber;

            _elevation = Round(_elevation / _clickInterval);
            _windage1 = Round(_windage1 / _clickInterval);
            _windage2 = Round(_windage2 / _clickInterval);
        };
    };

    _elevationOutput = Str(Round(_elevation * 100) / 100);
    _windageOutput = Str(Round(_windage1 * 100) / 100);

    _rangeOutput = Str(_range);
    if (_velocity < _speedOfSound) then {
        _rangeOutput = _rangeOutput + "*";
    };

    if (GVAR(currentUnit) == 1) then {
        _velocity = _velocity * 3.2808399;
    };

    switch (GVAR(rangeCardCurrentColumn)) do {
        case 0: {
            if (GVAR(showWind2)) then {
                _lastColumnOutput = Str(Round(_windage2 * 100) / 100);
            } else {
                _lastColumnOutput = Str(Round(_lead * 100) / 100);
            };
        };
        case 1: {
            _lastColumnOutput = Str(Round(_velocity));
        };
        case 2: {
            _lastColumnOutput = Str(Round(_kineticEnergy));
        };
        case 3: {
            _lastColumnOutput = Str(Round(_TOF * 100) / 100);
        }
    };

    lnbAddRow [5007, [_rangeOutput, _elevationOutput, _windageOutput, _lastColumnOutput]];
} forEach GVAR(rangeCardData);
