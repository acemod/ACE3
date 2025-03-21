#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the truing drop data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_truing_drop_data
 *
 * Public: No
 */

if (GVAR(currentUnit) == 2) then {
    ctrlSetText [18011, str(round(GVAR(truingDropRangeData) select 0))];
    ctrlSetText [18012, str(round(GVAR(truingDropRangeData) select 1))];
} else {
    ctrlSetText [18011, str(round((GVAR(truingDropRangeData) select 0) * 1.0936133))];
    ctrlSetText [18012, str(round((GVAR(truingDropRangeData) select 1) * 1.0936133))];
};

if (GVAR(truingDropMode) == 0) then {
    GVAR(truingDropDropData) set [0, GVAR(truingDropReferenceDropData) select 0];
} else {
    GVAR(truingDropDropData) set [0, GVAR(truingDropReferenceDropData) select 1];
};

private _dropUnit = GVAR(currentScopeUnit);
if (_dropUnit == 3) then {
    switch (GVAR(currentScopeClickUnit)) do {
        case 0: { _dropUnit = 1; };
        case 1: { _dropUnit = 2; };
        case 2: { _dropUnit = 0; };
    };
};

private _dropData = +GVAR(truingDropDropData);

switch (_dropUnit) do {
    case 0: {
        _dropData set [0, MOA_TO_MRAD(_dropData select 0)];
        _dropData set [1, MOA_TO_MRAD(_dropData select 1)];
        _dropData set [2, MOA_TO_MRAD(_dropData select 2)];
    };
    case 2: {
        _dropData set [0, (_dropData select 0) * 1.047];
        _dropData set [1, (_dropData select 1) * 1.047];
        _dropData set [2, (_dropData select 2) * 1.047];
    };
};

ctrlSetText [18006, str(round((_dropData select 0) * 100) / 100)];
ctrlSetText [18013, str(round((_dropData select 1) * 100) / 100)];
ctrlSetText [18014, str(round((_dropData select 2) * 100) / 100)];

if (GVAR(currentUnit) != 2) then {
    ctrlSetText [18007, str(round((GVAR(workingMemory) select 1) * 3.2808399))];
    ctrlSetText [18016, str(round((GVAR(workingMemory) select 1) * 3.2808399))];
    if (GVAR(truingDropMuzzleVelocity) > 0) then {
        ctrlSetText [18016, str(round(GVAR(truingDropMuzzleVelocity) * 3.2808399))];
    };
} else {
    ctrlSetText [18007, str(round(GVAR(workingMemory) select 1))];
    ctrlSetText [18016, str(round(GVAR(workingMemory) select 1))];
    if (GVAR(truingDropMuzzleVelocity) > 0) then {
        ctrlSetText [18016, str(round(GVAR(truingDropMuzzleVelocity)))];
    };
};
ctrlSetText [18008, str(round((GVAR(workingMemory) select 15) * 1000) / 1000)];
ctrlSetText [18017, str(round((GVAR(workingMemory) select 15) * 1000) / 1000)];
if (GVAR(truingDropC1) > 0) then {
    ctrlSetText [18017, str(round(GVAR(truingDropC1) * 1000) / 1000)];
};
