#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Updates injury list for given body part for the target.
 *
 * Arguments:
 * 0: Injury list <CONTROL>
 * 1: Target <OBJECT>
 * 2: Body part, -1 to only show overall health info <NUMBER>
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
private _nonissueColor = [1, 1, 1, 0.33];

// Indicate if unit is bleeding at all
if (IS_BLEEDING(_target)) then {
    switch (GVAR(showBleeding)) do {
        case 1: {
        //  Just show whether the unit is bleeding at all
            _entries pushBack [localize LSTRING(Status_Bleeding), [1, 0, 0, 1]];
        };
        case 2: {
            // Give a qualitative description of the rate of bleeding
            private _cardiacOutput = [_target] call EFUNC(medical_status,getCardiacOutput);
            private _bleedRate = GET_BLOOD_LOSS(_target);
            private _bleedRateKO = BLOOD_LOSS_KNOCK_OUT_THRESHOLD * (_cardiacOutput max 0.05);
            // Use nonzero minimum cardiac output to prevent all bleeding showing as massive during cardiac arrest
            switch (true) do {
                case (_bleedRate < _bleedRateKO * BLEED_RATE_SLOW): {
                    _entries pushBack [localize LSTRING(Bleed_Rate1), [1, 1, 0, 1]];
                };
                case (_bleedRate < _bleedRateKO * BLEED_RATE_MODERATE): {
                    _entries pushBack [localize LSTRING(Bleed_Rate2), [1, 0.67, 0, 1]];
                };
                case (_bleedRate < _bleedRateKO * BLEED_RATE_SEVERE): {
                    _entries pushBack [localize LSTRING(Bleed_Rate3), [1, 0.33, 0, 1]];
                };
                default {
                    _entries pushBack [localize LSTRING(Bleed_Rate4), [1, 0, 0, 1]];
                };
            };
        };
    };
} else {
    _entries pushBack [localize LSTRING(Status_Nobleeding), _nonissueColor];
};

if (GVAR(showBloodlossEntry)) then {
    // Give a qualitative description of the blood volume lost
    switch (GET_HEMORRHAGE(_target)) do {
        case 0: {
            _entries pushBack [localize LSTRING(Lost_Blood0), _nonissueColor];
        };
        case 1: {
            _entries pushBack [localize LSTRING(Lost_Blood1), [1, 1, 0, 1]];
        };
        case 2: {
            _entries pushBack [localize LSTRING(Lost_Blood2), [1, 0.67, 0, 1]];
        };
        case 3: {
            _entries pushBack [localize LSTRING(Lost_Blood3), [1, 0.33, 0, 1]];
        };
        case 4: {
            _entries pushBack [localize LSTRING(Lost_Blood4), [1, 0, 0, 1]];
        };
    };
};
// Show receiving IV volume remaining
private _fluidVolumes = createHashMap;
private _ivCfg = configFile >> "ace_medical_treatment" >> "IV";
{
    _x params ["_volumeRemaining", "_type"];
    private _guiMessage = GET_STRING(_ivCfg >> (_type + "IV") >> "gui_message",getText (_ivCfg >> "gui_message"));
    private _currentVolume = _fluidVolumes getOrDefault [_guiMessage, 0];
    _fluidVolumes set [_guiMessage, _currentVolume + _volumeRemaining];
} forEach (_target getVariable [QEGVAR(medical,ivBags), []]);

if (_fluidVolumes isNotEqualTo createHashMap) then {
    {
        _entries pushBack [format [_x, floor _y], [1, 1, 1, 1]];
    } forEach _fluidVolumes;
} else {
    _entries pushBack [localize ELSTRING(medical_treatment,Status_NoIv), _nonissueColor];
};

// Indicate the amount of pain the unit is in
if (_target call EFUNC(common,isAwake)) then {
    private _pain = GET_PAIN_PERCEIVED(_target);
    if (_pain > 0) then {
        private _painText = switch (true) do {
            case (_pain > PAIN_UNCONSCIOUS): {
                ELSTRING(medical_treatment,Status_SeverePain);
            };
            case (_pain > (PAIN_UNCONSCIOUS / 5)): {
                ELSTRING(medical_treatment,Status_Pain);
            };
            default {
                ELSTRING(medical_treatment,Status_MildPain);
            };
        };
        _entries pushBack [localize _painText, [1, 1, 1, 1]];
    } else {
        _entries pushBack [localize ELSTRING(medical_treatment,Status_NoPain), _nonissueColor];
    };
};

// Skip the rest as they're body part specific
if (_selectionN == -1) exitWith {
    // Add all entries to injury list
    lbClear _ctrl;

    {
        _x params ["_text", "_color"];

        _ctrl lbSetColor [_ctrl lbAdd _text, _color];
    } forEach _entries;

    _ctrl lbSetCurSel -1;
};

[QGVAR(updateInjuryListGeneral), [_ctrl, _target, _selectionN, _entries]] call CBA_fnc_localEvent;

_entries pushBack ["", [1, 1, 1, 1]];

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

// Damage taken tooltip
if (GVAR(showDamageEntry)) then {
    private _bodyPartDamage = GET_BODYPART_DAMAGE(_target) select _selectionN;
    if (_bodyPartDamage > 0) then {
        private _damageThreshold = GET_DAMAGE_THRESHOLD(_target);
        switch (true) do {
            case (_selectionN > 3): { // legs: index 4 & 5
                if (EGVAR(medical,limbDamageThreshold) != 0 && {[false, !isPlayer _target, true] select EGVAR(medical,useLimbDamage)}) then { // Just indicate how close to the limping threshold we are
                    _damageThreshold = _damageThreshold * EGVAR(medical,limbDamageThreshold);
                } else {
                    _damageThreshold = FRACTURE_DAMAGE_THRESHOLD * 4;
                };
            };
            case (_selectionN > 1): { // arms: index 2 & 3
                if (EGVAR(medical,limbDamageThreshold) != 0 && {[false, !isPlayer _target, true] select EGVAR(medical,useLimbDamage)}) then { // Just indicate how close to the fracture threshold we are
                    _damageThreshold = _damageThreshold * EGVAR(medical,limbDamageThreshold);
                } else {
                    _damageThreshold = FRACTURE_DAMAGE_THRESHOLD * 4;
                };
            };
            case (_selectionN == 0): { // head: index 0
                _damageThreshold = _damageThreshold * 1.25;
            };
            default { // torso: index 1
                _damageThreshold = _damageThreshold * 1.5;
            };
        };
        // _bodyPartDamage here should indicate how close unit is to guaranteed death via sum of trauma, so use the same multipliers used in medical_damage/functions/fnc_determineIfFatal.sqf
        _bodyPartDamage = (_bodyPartDamage / (_damageThreshold max 0.01)) min 1;
        switch (true) do {
            case (_bodyPartDamage isEqualTo 1): {
                _entries pushBack [localize LSTRING(traumaSustained4), [_bodyPartDamage] call FUNC(damageToRGBA)];
            };
            case (_bodyPartDamage >= 0.75): {
                _entries pushBack [localize LSTRING(traumaSustained3), [_bodyPartDamage] call FUNC(damageToRGBA)];
            };
            case (_bodyPartDamage >= 0.5): {
                _entries pushBack [localize LSTRING(traumaSustained2), [_bodyPartDamage] call FUNC(damageToRGBA)];
            };
            case (_bodyPartDamage >= 0.25): {
                _entries pushBack [localize LSTRING(traumaSustained1), [_bodyPartDamage] call FUNC(damageToRGBA)];
            };
        };
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
        if (EGVAR(medical,fractures) in [2, 3]) then { // Ignore if the splint has no effect
            _entries pushBack [localize LSTRING(Status_SplintApplied), [0.2, 0.2, 1, 1]];
        };
    };
};

[QGVAR(updateInjuryListPart), [_ctrl, _target, _selectionN, _entries, _bodyPartName]] call CBA_fnc_localEvent;

// Add entries for open, bandaged, and stitched wounds
private _woundEntries = [];

private _fnc_processWounds = {
    params ["_wounds", "_format", "_color"];

    {
        _x params ["_woundClassID", "_amountOf"];

        if (_amountOf > 0) then {
            private _classIndex = _woundClassID / 10;
            private _category   = _woundClassID % 10;

            private _className = EGVAR(medical_damage,woundClassNames) select _classIndex;
            private _suffix = ["Minor", "Medium", "Large"] select _category;
            private _woundName = localize format [ELSTRING(medical_damage,%1_%2), _className, _suffix];

            private _woundDescription = if (_amountOf >= 1) then {
                format ["%1x %2", ceil _amountOf, _woundName]
            } else {
                format [localize LSTRING(PartialX), _woundName]
            };

            _woundEntries pushBack [format [_format, _woundDescription], _color];
        };
    } forEach (_wounds getOrDefault [ALL_BODY_PARTS select _selectionN, []]);
};

[GET_OPEN_WOUNDS(_target), "%1", [1, 1, 1, 1]] call _fnc_processWounds;
[GET_BANDAGED_WOUNDS(_target), "[B] %1", [0.88, 0.7, 0.65, 1]] call _fnc_processWounds;
[GET_STITCHED_WOUNDS(_target), "[S] %1", [0.7, 0.7, 0.7, 1]] call _fnc_processWounds;

[QGVAR(updateInjuryListWounds), [_ctrl, _target, _selectionN, _woundEntries, _bodyPartName]] call CBA_fnc_localEvent;

// Handle no wound entries
if (_woundEntries isEqualTo []) then {
    _entries pushBack [localize ELSTRING(medical_treatment,NoInjuriesBodypart), _nonissueColor];
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
