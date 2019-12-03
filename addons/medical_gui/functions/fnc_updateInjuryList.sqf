#include "script_component.hpp"
/*
 * Author: mharis001
 * Updates injury list for given body part for the target.
 *
 * Arguments:
 * 0: Injury list <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body part <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrlInjuries, _target, 0] call ace_medical_gui_fnc_updateInjuryList
 *
 * Public: No
 */

params ["_ctrl", "_target", "_selectionN"];

private _entries = [];

// Add selected body part name
private _bodyPartName = [
    LSTRING(Head),
    LSTRING(Torso),
    LSTRING(LeftArm),
    LSTRING(RightArm),
    LSTRING(LeftLeg),
    LSTRING(RightLeg)
] select _selectionN;

_entries pushBack [localize _bodyPartName, [1, 1, 1, 1]];

// Indicate if unit is bleeding at all
if (IS_BLEEDING(_target)) then {
    _entries pushBack [localize LSTRING(Status_Bleeding), [1, 0, 0, 1]];
};

// Give a qualitative description of the blood volume lost
switch (GET_HEMORRHAGE(_target)) do {
    case 1: {
        _entries pushBack [localize LSTRING(Lost_Blood1), [1, 0, 0, 1]];
    };
    case 2: {
        _entries pushBack [localize LSTRING(Lost_Blood2), [1, 0, 0, 1]];
    };
    case 3: {
        _entries pushBack [localize LSTRING(Lost_Blood3), [1, 0, 0, 1]];
    };
    case 4: {
        _entries pushBack [localize LSTRING(Lost_Blood4), [1, 0, 0, 1]];
    };
};

// Indicate if a tourniquet is applied
if (HAS_TOURNIQUET_APPLIED_ON(_target,_selectionN)) then {
    _entries pushBack [localize LSTRING(Status_Tourniquet_Applied), [0.77, 0.51, 0.08, 1]];
};

// Indicate current body part fracture status
switch (GET_FRACTURES(_target) select _selectionN) do {
    case 1: {
        _entries pushBack [localize LSTRING(Status_Fractured), [1, 0, 0, 1]];
    };
    case -1: {
        if (EGVAR(medical,fractures) == 2) then { // Ignore if the splint has no effect
            _entries pushBack [localize LSTRING(Status_SplintApplied), [1, 1, 1, 1]];
        };
    };
};

// Indicate the amount of pain the unit is in
if (_target call EFUNC(common,isAwake)) then {
    private _pain = GET_PAIN_PERCEIVED(_target);
    if (_pain > 0) then {
        private _painText = switch (true) do {
            case (_pain > 0.5): {
                ELSTRING(medical_treatment,Status_SeverePain);
            };
            case (_pain > 0.1): {
                ELSTRING(medical_treatment,Status_Pain);
            };
            default {
                ELSTRING(medical_treatment,Status_MildPain);
            };
        };
        _entries pushBack [localize _painText, [1, 1, 1, 1]];
    };
};

// Show receiving IV volume remaining
private _totalIvVolume = 0;
{
    _x params ["_volumeRemaining"];
    _totalIvVolume = _totalIvVolume + _volumeRemaining;
} forEach (_target getVariable [QEGVAR(medical,ivBags), []]);

if (_totalIvVolume >= 1) then {
    _entries pushBack [format [localize ELSTRING(medical_treatment,receivingIvVolume), floor _totalIvVolume], [1, 1, 1, 1]];
};

// Add entries for open, bandaged, and stitched wounds
private _woundEntries = [];

private _fnc_getWoundDescription = {
    private _classIndex = _woundClassID / 10;
    private _category = _woundClassID % 10;
    private _className = EGVAR(medical_damage,woundsData) select _classIndex select 6;
    private _suffix = ["Minor", "Medium", "Large"] select _category;
    private _woundName = localize format [ELSTRING(medical_damage,%1_%2), _className, _suffix];
    if (_amountOf >= 1) then {
        format ["%1x %2", ceil _amountOf, _woundName];
    } else {
        format [localize LSTRING(PartialX), _woundName];
    };
};

{
    _x params ["_woundClassID", "_bodyPartN", "_amountOf"];
    if (_selectionN == _bodyPartN) then {
        if (_amountOf > 0) then {
            _woundEntries pushBack [call _fnc_getWoundDescription, [1, 1, 1, 1]];
        } else {
            if !(EGVAR(medical_treatment,advancedBandages) && {EGVAR(medical_treatment,woundReopening)}) then {
                _woundEntries pushBack [format ["[B] %1", call _fnc_getWoundDescription], [0.7, 0.7, 0.7, 1]];
            };
        };
    };
} forEach GET_OPEN_WOUNDS(_target);

{
    _x params ["_woundClassID", "_bodyPartN", "_amountOf"];
    if (_selectionN == _bodyPartN && {_amountOf > 0}) then {
        _woundEntries pushBack [format ["[B] %1", call _fnc_getWoundDescription], [0.88, 0.7, 0.65, 1]];
    };
} forEach GET_BANDAGED_WOUNDS(_target);

{
    _x params ["_woundClassID", "_bodyPartN", "_amountOf"];
    if (_selectionN == _bodyPartN && {_amountOf > 0}) then {
        _woundEntries pushBack [format ["[S] %1", call _fnc_getWoundDescription], [0.7, 0.7, 0.7, 1]];
    };
} forEach GET_STITCHED_WOUNDS(_target);

// Handle no wound entries
if (_woundEntries isEqualTo []) then {
    _entries pushBack [localize ELSTRING(medical_treatment,NoInjuriesBodypart), [1, 1, 1, 1]];
} else {
    _entries append _woundEntries;
};

// Add all entries to injury list
lbClear _ctrl;

{
    _x params ["_text", "_color"];

    _ctrl lbSetColor [_ctrl lbAdd _text, _color];
} forEach _entries;

_ctrl lbSetCurSel -1;
