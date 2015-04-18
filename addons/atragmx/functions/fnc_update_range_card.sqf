/*
 * Author: Ruthberg
 * Updates the range card listbox content
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_range_card
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_range", "_elevation", "_windage", "_elevationScopeStep", "_windageScopeStep", "_lead", "_TOF", "_velocity", "_kineticEnergy", "_rangeOutput", "_elevationOutput", "_windageOutput", "_lastColumnOutput"];
_lastColumnOutput = "";

ctrlSetText [5006, (GVAR(rangeCardLastColumns) select GVAR(rangeCardCurrentColumn))];

if (GVAR(currentUnit) == 1) then {
    ctrlSetText [5003, "Yards"];
} else {
    ctrlSetText [5003, "Meters"];
};

lnbClear 5007;

{
    _range = _x select 0;
    _elevation = _x select 1;
    _windage = _x select 2;
    _lead = _x select 3;
    _TOF =  _x select 4;
    _velocity = _x select 5;
    _kineticEnergy = _x select 6;
    
    switch (GVAR(currentScopeUnit)) do {
        case 0: {
            _elevation = _elevation / 3.38;
            _windage = _windage / 3.38;
        }; 
        case 2: {
            _elevation = _elevation * 1.047;
            _windage = _windage * 1.047;
        };
        case 3: {
            _elevationScopeStep = (GVAR(workingMemory) select 7);
            _windageScopeStep = (GVAR(workingMemory) select 8);
            
            _elevation = Round(_elevation / _elevationScopeStep);
            _windage = Round(_windage / _windageScopeStep);
        };
    };
    
    _elevationOutput = Str(Round(_elevation * 100) / 100);
    _windageOutput = Str(Round(_windage * 100) / 100);
    
    _rangeOutput = Str(_range);
    if (_velocity < 340.29) then {
        _rangeOutput = _rangeOutput + "*";
    };
    
    if (GVAR(currentUnit) == 1) then {
        _velocity = _velocity * 3.2808399;
    };
    
    switch (GVAR(rangeCardCurrentColumn)) do {
        case 0: {
            _lastColumnOutput = Str(Round(_lead * 100) / 100);
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
