/*
 * Author: Ruthberg
 * Updates the result input and output fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_result
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_elevationAbs", "_elevationRel", "_elevationCur", "_windageAbs", "_wind2", "_windageRel", "_windageCur", "_lead", "_clickSize", "_clickNumber", "_clickInterval"];
_elevationAbs = GVAR(elevationOutput) select GVAR(currentTarget);
_windageAbs = GVAR(windage1Output) select GVAR(currentTarget);

_wind2 = GVAR(windage2Output) select GVAR(currentTarget);

_elevationCur = GVAR(workingMemory) select 10;
_windageCur = GVAR(workingMemory) select 11;

_elevationRel = _elevationAbs - _elevationCur;
_windageRel = _windageAbs - _windageCur;

_lead = GVAR(leadOutput) select GVAR(currentTarget);

switch (GVAR(currentScopeUnit)) do {
    case 0: {
        _elevationAbs = _elevationAbs / 3.38;
        _windageAbs = _windageAbs / 3.38;
        
        _wind2 = _wind2 / 3.38;
        
        _elevationRel = _elevationRel / 3.38;
        _windageRel = _windageRel / 3.38;
        
        _elevationCur = _elevationCur / 3.38;
        _windageCur = _windageCur / 3.38;
    };
    case 2: {
        _elevationAbs = _elevationAbs * 1.047;
        _windageAbs = _windageAbs * 1.047;
        
        _wind2 = _wind2 / 1.047;
        
        _elevationRel = _elevationRel * 1.047;
        _windageRel = _windageRel * 1.047;
        
        _elevationCur = _elevationCur * 1.047;
        _windageCur = _windageCur * 1.047;
    };
    case 3: {
        switch (GVAR(workingMemory) select 7) do {
            case 0: { _clickSize = 1; };
            case 1: { _clickSize = 1 / 1.047; };
            case 2: { _clickSize = 3.38; };
        };
        _clickNumber = GVAR(workingMemory) select 8;
        _clickInterval = _clickSize / _clickNumber;
        
        _elevationAbs = Round(_elevationAbs / _clickInterval);
        _windageAbs = Round(_windageAbs / _clickInterval);
        
        _wind2 = Round(_wind2 / _clickInterval);
        
        _elevationRel = Round(_elevationRel / _clickInterval);
        _windageRel = Round(_windageRel / _clickInterval);
        
        _elevationCur = Round(_elevationCur / _clickInterval);
        _windageCur = Round(_windageCur / _clickInterval);
    };
};

if (GVAR(showWind2)) then {
    ctrlSetText [42, "Wind2"];
} else {
    ctrlSetText [42, "Lead"];
};

ctrlSetText [400, Str(Round(_elevationAbs * 100) / 100)];
ctrlSetText [401, Str(Round(_elevationRel * 100) / 100)];
ctrlSetText [402, Str(Round(_elevationCur * 100) / 100)];

ctrlSetText [410, Str(Round(_windageAbs * 100) / 100)];
ctrlSetText [411, Str(Round(_windageRel * 100) / 100)];
ctrlSetText [412, Str(Round(_windageCur * 100) / 100)];

if (GVAR(showWind2)) then {
    ctrlSetText [420, Str(Round(_wind2 * 100) / 100)];
} else {
    ctrlSetText [420, Str(Round(_lead * 100) / 100)];
};