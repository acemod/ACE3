#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the result input and output fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_result
 *
 * Public: No
 */

private _elevationAbs = GVAR(elevationOutput) select GVAR(currentTarget);
private _elevationRel = 0;
private _elevationCur = 0;
private _windageAbs = GVAR(windage1Output) select GVAR(currentTarget);
private _windageRel = 0;
private _windageCur = 0;

private _wind2 = GVAR(windage2Output) select GVAR(currentTarget);

if (GVAR(showCoriolis)) then {
    _elevationRel = GVAR(verticalCoriolisOutput) select GVAR(currentTarget);
    _windageRel = GVAR(horizontalCoriolisOutput) select GVAR(currentTarget);

    _windageCur = GVAR(spinDriftOutput) select GVAR(currentTarget);
} else {
    _elevationCur = GVAR(workingMemory) select 10;
    _windageCur = GVAR(workingMemory) select 11;

    _elevationRel = _elevationAbs - _elevationCur;
    _windageRel = _windageAbs - _windageCur;
};

private _lead = GVAR(leadOutput) select GVAR(currentTarget);

switch (GVAR(currentScopeUnit)) do {
    case 0: {
        _elevationAbs = MOA_TO_MRAD(_elevationAbs);
        _windageAbs = MOA_TO_MRAD(_windageAbs);

        _wind2 = MOA_TO_MRAD(_wind2);

        _elevationRel = MOA_TO_MRAD(_elevationRel);
        _windageRel = MOA_TO_MRAD(_windageRel);

        _elevationCur = MOA_TO_MRAD(_elevationCur);
        _windageCur = MOA_TO_MRAD(_windageCur);
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
        private _clickSize = [1, 1 / 1.047, MRAD_TO_MOA(1)] select (GVAR(workingMemory) select 7);
        private _clickNumber = GVAR(workingMemory) select 8;
        private _clickInterval = _clickSize / _clickNumber;

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

_elevationAbs = Round(_elevationAbs * 100) / 100;
if (_elevationAbs > 0) then {
    ctrlSetText [400, str abs _elevationAbs];
} else {
    if (_elevationAbs < 0) then {
        ctrlSetText [400, format["%1D", abs(_elevationAbs)]];
    } else {
        ctrlSetText [400, "0.0"];
    };
};
_elevationRel = Round(_elevationRel * 100) / 100;
if (_elevationRel > 0) then {
    ctrlSetText [401, str abs _elevationRel];
} else {
    if (_elevationRel < 0) then {
        ctrlSetText [401, format["%1D", abs(_elevationRel)]];
    } else {
        ctrlSetText [401, "0.0"];
    };
};
_elevationCur = Round(_elevationCur * 100) / 100;
if (_elevationCur > 0) then {
    ctrlSetText [402, str abs _elevationCur];
} else {
    if (_elevationCur < 0) then {
        ctrlSetText [402, format["%1D", abs(_elevationCur)]];
    } else {
        ctrlSetText [402, "0.0"];
    };
};

_windageAbs = Round(_windageAbs * 100) / 100;
if (_windageAbs > 0) then {
    ctrlSetText [410, format["%1R", abs(_windageAbs)]];
} else {
    if (_windageAbs < 0) then {
        ctrlSetText [410, format["%1L", abs(_windageAbs)]];
    } else {
        ctrlSetText [410, "0.0"];
    };
};
_windageRel = Round(_windageRel * 100) / 100;
if (_windageRel > 0) then {
    ctrlSetText [411, format["%1R", abs(_windageRel)]];
} else {
    if (_windageRel < 0) then {
        ctrlSetText [411, format["%1L", abs(_windageRel)]];
    } else {
        ctrlSetText [411, "0.0"];
    };
};
_windageCur = Round(_windageCur * 100) / 100;
if (_windageCur > 0) then {
    ctrlSetText [412, format["%1R", abs(_windageCur)]];
} else {
    if (_windageCur < 0) then {
        ctrlSetText [412, format["%1L", abs(_windageCur)]];
    } else {
        ctrlSetText [412, "0.0"];
    };
};

if (GVAR(showWind2)) then {
    _wind2 = Round(_wind2 * 100) / 100;
    if (_wind2 > 0) then {
        ctrlSetText [420, format["%1R", abs(_wind2)]];
    } else {
        if (_wind2 < 0) then {
            ctrlSetText [420, format["%1L", abs(_wind2)]];
        } else {
            ctrlSetText [420, "0.0"];
        };
    };
} else {
    _lead = Round(_lead * 100) / 100;
    if (_lead > 0) then {
        if ((GVAR(targetSpeedDirection) select GVAR(currentTarget)) == 1) then {
            ctrlSetText [420, format["%1R", abs(_lead)]];
        } else {
            ctrlSetText [420, format["%1L", abs(_lead)]];
        };
    } else {
        ctrlSetText [420, "0.0"];
    };
};
