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

private _lastColumnOutput = "";

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

private _speedOfSound = GVAR(temperature) call EFUNC(weather,calculateSpeedOfSound);

{
    private _range = _x select 0;
    private _elevation = _x select 1;
    private _windage1 = (_x select 2) select 0;
    private _windage2 = (_x select 2) select 1;
    private _lead = _x select 3;
    private _TOF =  _x select 4;
    private _velocity = _x select 5;
    private _kineticEnergy = _x select 6;

    switch (GVAR(currentScopeUnit)) do {
        case 0: {
            _elevation = MOA_TO_MRAD(_elevation);
            _windage1 = MOA_TO_MRAD(_windage1);
            _windage2 = MOA_TO_MRAD(_windage2);
        };
        case 2: {
            _elevation = _elevation * 1.047;
            _windage1 = _windage1 * 1.047;
            _windage2 = _windage2 * 1.047;
        };
        case 3: {
            private _clickSize = [1, 1 / 1.047, MRAD_TO_MOA(1)] select (GVAR(workingMemory) select 7);
            private _clickNumber = GVAR(workingMemory) select 8;
            private _clickInterval = _clickSize / _clickNumber;

            _elevation = Round(_elevation / _clickInterval);
            _windage1 = Round(_windage1 / _clickInterval);
            _windage2 = Round(_windage2 / _clickInterval);
        };
    };

    private _elevationOutput = Str(Round(_elevation * 100) / 100);
    private _windageOutput = Str(Round(_windage1 * 100) / 100);

    private _rangeOutput = Str(_range);
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
