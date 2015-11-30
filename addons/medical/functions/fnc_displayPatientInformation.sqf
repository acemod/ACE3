/*
 * Author: Glowbal
 * Displays the patient information for given unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Show <BOOL> (default: true)
 * 2: Selection <NUMBER> (default: 0)
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
#define MAX_DISTANCE 10

// Exit for basic medical
if (GVAR(level) < 2) exitWith {};
private ["_amountOfGeneric", "_bandagedwounds", "_logCtrl", "_part", "_partText", "_pointDamage", "_severity", "_total", "_totalIvVolume", "_triageStatus", "_type"];
params ["_target", ["_show", true], ["_selectionN", 0]];

GVAR(currentSelectedSelectionN) = [0, _selectionN] select (IS_SCALAR(_selectionN));
GVAR(displayPatientInformationTarget) = [ObjNull, _target] select _show;

if (USE_WOUND_EVENT_SYNC) then {
    [_target, ACE_player] call FUNC(requestWoundSync);
};

if (_show) then {
    ("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutRsc [QGVAR(DisplayInformation),"PLAIN"];

    [{
        private ["_target", "_display", "_alphaLevel", "_damaged", "_availableSelections", "_openWounds", "_selectionBloodLoss", "_red", "_green", "_blue", "_alphaLevel", "_allInjuryTexts", "_lbCtrl", "_genericMessages"];
        params ["_args", "_idPFH"];
        _args params ["_target", "_selectionN"];

        if (GVAR(displayPatientInformationTarget) != _target || GVAR(currentSelectedSelectionN) != _selectionN) exitWith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
        if (ACE_player distance _target > MAX_DISTANCE) exitWith {
            ("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
            [_idPFH] call CBA_fnc_removePerFrameHandler;
            ["displayTextStructured", [ACE_player], [[LSTRING(DistanceToFar), [_target] call EFUNC(common,getName)], 1.75, ACE_player]] call EFUNC(common,targetEvent);
        };

        disableSerialization;
        _display = uiNamespace getvariable QGVAR(DisplayInformation);
        if (isnil "_display") exitWith {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };

        _allInjuryTexts = [];
        _genericMessages = [];

        if (GVAR(level) >= 2 && {([_unit] call FUNC(hasMedicalEnabled))}) then {
            _partText = [LSTRING(Head), LSTRING(Torso), LSTRING(LeftArm) ,LSTRING(RightArm) ,LSTRING(LeftLeg), LSTRING(RightLeg)] select _selectionN;
            _genericMessages pushback [localize _partText, [1, 1, 1, 1]];
        };

        if (_target getvariable[QGVAR(isBleeding), false]) then {
            _genericMessages pushback [localize LSTRING(Status_Bleeding), [1, 0.1, 0.1, 1]];
        };
        if (_target getvariable[QGVAR(hasLostBlood), 0] > 1) then {
            _genericMessages pushback [localize LSTRING(Status_Lost_Blood), [1, 0.1, 0.1, 1]];
        };

        if (((_target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]]) select _selectionN) > 0) then {
            _genericMessages pushback [localize LSTRING(Status_Tourniquet_Applied), [0.77, 0.51, 0.08, 1]];
        };
        if (_target getvariable[QGVAR(hasPain), false]) then {
            _genericMessages pushback [localize LSTRING(Status_Pain), [1, 1, 1, 1]];
        };

        _totalIvVolume = 0;
        {
            private "_value";
            _value = _target getvariable _x;
            if !(isnil "_value") then {
                _totalIvVolume = _totalIvVolume + (_target getvariable [_x, 0]);
            };
        } foreach GVAR(IVBags);
        if (_totalIvVolume >= 1) then {
            _genericMessages pushback [format[localize LSTRING(receivingIvVolume), floor _totalIvVolume], [1, 1, 1, 1]];
        };

        _damaged = [false, false, false, false, false, false];
        _selectionBloodLoss = [0,0,0,0,0,0];
        if (GVAR(level) >= 2 && {([_target] call FUNC(hasMedicalEnabled))}) then {
            _openWounds = _target getvariable [QGVAR(openWounds), []];
            private "_amountOf";
            {
                _x params ["", "_x1", "_selectionX", "_amountOf", "_x4"];
                // Find how much this bodypart is bleeding
                if (_amountOf > 0) then {
                    _damaged set[_selectionX, true];
                    _selectionBloodLoss set [_selectionX, (_selectionBloodLoss select _selectionX) + (20 * (_x4 * _amountOf))];

                    if (_selectionN == _selectionX) then {
                    // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
                        if (_amountOf >= 1) then {
                            // TODO localization
                            _allInjuryTexts pushback [format["%2x %1", (GVAR(AllWoundInjuryTypes) select _x1) select 6, _amountOf], [1,1,1,1]];
                        } else {
                            // TODO localization
                            _allInjuryTexts pushback [format["Partial %1", (GVAR(AllWoundInjuryTypes) select _x1) select 6], [1,1,1,1]];
                        };
                    };
                };
            } foreach _openWounds;

            _bandagedwounds = _target getvariable [QGVAR(bandagedWounds), []];
            {
                _x params ["", "", "_selectionX", "_amountOf", "_x4"];
                // Find how much this bodypart is bleeding
                if !(_damaged select _selectionX) then {
                    _selectionBloodLoss set [_selectionX, (_selectionBloodLoss select _selectionX) + (20 * (_x4 * _amountOf))];
                };
                if (_selectionN == _selectionX) then {
                    // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
                    if (_amountOf > 0) then {
                        if (_amountOf >= 1) then {
                            // TODO localization
                            _allInjuryTexts pushback [format["[B] %2x %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6, _amountOf], [0.88,0.7,0.65,1]];
                        } else {
                            // TODO localization
                            _allInjuryTexts pushback [format["[B] Partial %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6], [0.88,0.7,0.65,1]];
                        };
                    };
                };
            } foreach _bandagedwounds;
        } else {
            _damaged = [true, true, true, true, true, true];
            {
                _selectionBloodLoss set [_forEachIndex, _target getHitPointDamage _x];

                if (_target getHitPointDamage _x > 0 && {_forEachIndex == _selectionN}) then {
                    _pointDamage = _target getHitPointDamage _x;
                    _severity = switch (true) do {
                        case (_pointDamage > 0.5): {localize LSTRING(HeavilyWounded)};
                        case (_pointDamage > 0.1): {localize LSTRING(LightlyWounded)};
                        default                    {localize LSTRING(VeryLightlyWounded)};
                    };
                    _part = localize ([
                        LSTRING(Head),
                        LSTRING(Torso),
                        LSTRING(LeftArm),
                        LSTRING(RightArm),
                        LSTRING(LeftLeg),
                        LSTRING(RightLeg)
                    ] select _forEachIndex);
                    _allInjuryTexts pushBack [format ["%1 %2", _severity, toLower _part], [1,1,1,1]];
                };
            } forEach ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
        };

        // Handle the body image coloring

        _availableSelections = [50,51,52,53,54,55];
        {
            private ["_red", "_green", "_blue", "_total"];
            _total = _x;

            _red = 1;
            _green = 1;
            _blue = 1;
            if (_total > 0) then {
                if (_damaged select _forEachIndex) then {
                    _green = (0.9 - _total) max 0;
                    _blue = _green;
                } else {
                    _green = (0.9 - _total) max 0;
                    _red = _green;
                    //_blue = _green;
                };
            };
            (_display displayCtrl (_availableSelections select _foreachIndex)) ctrlSetTextColor [_red, _green, _blue, 1.0];
        } foreach _selectionBloodLoss;

        _lbCtrl = (_display displayCtrl 200);
        lbClear _lbCtrl;
        {
            _x params ["_add", "_color"];
            _lbCtrl lbAdd _add;
            _lbCtrl lbSetColor [_foreachIndex, _color];
        } foreach _genericMessages;

        _amountOfGeneric = count _genericMessages;
        {
            _x params ["_add", "_color"];
            _lbCtrl lbAdd _add;
            _lbCtrl lbSetColor [_foreachIndex + _amountOfGeneric, _color];
        } foreach _allInjuryTexts;
        if (count _allInjuryTexts == 0) then {
            _lbCtrl lbAdd (localize LSTRING(NoInjuriesBodypart));
        };

        _logCtrl = (_display displayCtrl 302);
        lbClear _logCtrl;

        private ["_logs", "_message", "_moment", "_arguments", "_lbCtrl"];
        _logs = _target getvariable [QGVAR(logFile_Activity), []];
        {
            // [_message,_moment,_type, _arguments]
            _x params ["_message", "_moment", "_type", "_arguments"];
            if (isLocalized _message) then {
                _message = localize _message;
            };

            {
                if (typeName _x == "STRING" && {isLocalized _x}) then {
                    _arguments set [_foreachIndex, localize _x];
                };
            } foreach _arguments;
            _message = format([_message] + _arguments);
            _logCtrl lbAdd format["%1 %2", _moment, _message];
        } foreach _logs;

        _triageStatus = [_target] call FUNC(getTriageStatus);
        (_display displayCtrl 303) ctrlSetText (_triageStatus select 0);
        (_display displayCtrl 303) ctrlSetBackgroundColor (_triageStatus select 2);

    }, 0, [_target, GVAR(currentSelectedSelectionN)]] call CBA_fnc_addPerFrameHandler;

} else {
    ("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};
