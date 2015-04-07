/*
 * Author: Glowbal
 * Displays the patient information for given unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Show <BOOL> <OPTIONAL>
 *
 * ReturnValue:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_show"];
_target = _this select 0;
_show = if (count _this > 1) then {_this select 1} else {true};
GVAR(currentSelectedSelectionN) = if (count _this > 2) then {_this select 2} else {0};

GVAR(displayPatientInformationTarget) = if (_show) then {_target} else {ObjNull};

if (USE_WOUND_EVENT_SYNC) then {
    [_target, ACE_player] call FUNC(requestWoundSync);
};

if (_show) then {
    ("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutRsc [QGVAR(DisplayInformation),"PLAIN"];

    [{
        private ["_target", "_display", "_alphaLevel", "_damaged", "_availableSelections", "_openWounds", "_selectionBloodLoss", "_red", "_green", "_blue", "_alphaLevel", "_allInjuryTexts", "_lbCtrl", "_genericMessages"];
        _target = (_this select 0) select 0;
        _selectionN = (_this select 0) select 1;

        if (GVAR(displayPatientInformationTarget) != _target || GVAR(currentSelectedSelectionN) != _selectionN) exitwith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        disableSerialization;
        _display = uiNamespace getvariable QGVAR(DisplayInformation);
        if (isnil "_display") exitwith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        _allInjuryTexts = [];
        _genericMessages = [];

        _partText = ["STR_ACE_Interaction_Head", "STR_ACE_Interaction_Torso", "STR_ACE_Interaction_ArmLeft" ,"STR_ACE_Interaction_ArmRight" ,"STR_ACE_Interaction_LegLeft", "STR_ACE_Interaction_LegRight"] select _selectionN;
        _genericMessages pushback [localize _partText, [1, 1, 1, 1]];

        if (_target getvariable[QGVAR(isBleeding), false]) then {
            _genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_BLEEDING", [1, 0.1, 0.1, 1]];
        };
        if (_target getvariable[QGVAR(hasLostBlood), false]) then {
            _genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_LOST_BLOOD", [1, 0.1, 0.1, 1]];
        };

        if (((_target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]]) select _selectionN) > 0) then {
            _genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_TOURNIQUET_APPLIED", [0.77, 0.51, 0.08, 1]];
        };
        if (_target getvariable[QGVAR(hasPain), false]) then {
            _genericMessages pushback [localize "STR_ACE_MEDICAL_STATUS_PAIN", [1, 1, 1, 1]];
        };

        _totalIvVolume = 0;
        {
            private "_value";
            _value = _target getvariable _x;
            if !(isnil "_value") then {
                _totalIvVolume = _totalIvVolume + (_target getvariable [_x, 0]);
            };
        }foreach GVAR(IVBags);
        if (_totalIvVolume >= 1) then {
            _genericMessages pushback [format[localize "STR_ACE_MEDICAL_receivingIvVolume", floor _totalIvVolume], [1, 1, 1, 1]];
        };

        _selectionBloodLoss = [0,0,0,0,0,0];
        if (GVAR(level) >= 2) then {
            _openWounds = _target getvariable [QGVAR(openWounds), []];
            private "_amountOf";
            {
                _amountOf = _x select 3;
                // Find how much this bodypart is bleeding
                _selectionBloodLoss set [(_x select 2), (_selectionBloodLoss select (_x select 2)) + (15 * ((_x select 4) * _amountOf))];
                if (GVAR(currentSelectedSelectionN) == (_x select 2)) then {
                    // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
                    if (_amountOf > 0) then {
                        if (_amountOf >= 1) then {
                            // TODO localization
                            _allInjuryTexts pushback [format["%2x %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6, _amountOf], [1,1,1,1]];
                        } else {
                            // TODO localization
                            _allInjuryTexts pushback [format["Partial %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6], [1,1,1,1]];
                        };
                    };
                };
            }foreach _openWounds;

            _bandagedwounds = _target getvariable [QGVAR(bandagedWounds), []];
            {
                _amountOf = _x select 3;
                // Find how much this bodypart is bleeding
                //if (_selectionBloodLoss select (_x select 2) == 0) then {
                //    _selectionBloodLoss set [(_x select 2), (_selectionBloodLoss select (_x select 2)) + (15 * ((_x select 4) * _amountOf))];
                //};
                if (GVAR(currentSelectedSelectionN) == (_x select 2)) then {
                    // Collect the text to be displayed for this injury [ Select injury class type definition - select the classname DisplayName (6th), amount of injuries for this]
                    if (_amountOf > 0) then {
                        if (_amountOf >= 1) then {
                            // TODO localization
                            _allInjuryTexts pushback [format["[B] %2x %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6, _amountOf], [1,0.5,0.5,1]];
                        } else {
                            // TODO localization
                            _allInjuryTexts pushback [format["[B] Partial %1", (GVAR(AllWoundInjuryTypes) select (_x select 1)) select 6], [1,0.5,0.5,1]];
                        };
                    };
                };
            }foreach _bandagedwounds;
        } else {
            {
                _selectionBloodLoss set [_forEachIndex, _target getHitPointDamage _x];

                if (_target getHitPointDamage _x > 0.1) then {
                    // @todo localize
                    _allInjuryTexts pushBack [format ["%1 %2",
                        ["Lightly wounded", "Heavily wounded"] select (_target getHitPointDamage _x > 0.5),
                        ["head", "torso", "left arm", "right arm", "left leg", "right leg"] select _forEachIndex
                    ], [1,1,1,1]];
                };
            } forEach ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
        };

        // Handle the body image coloring
        _damaged = [false, false, false, false, false, false];
        _availableSelections = [50,51,52,53,54,55];
        {
            private ["_red", "_green", "_blue"];
            _total = _x;

            _red = 1;
            _green = 1;
            _blue = 1;
            if (_total >0) then {
                _green = 0.9 - _total;
                if (_green < 0.0) then {
                    _green = 0.0;
                };
                _blue = _green;
                _damaged set[_foreachIndex, true];
            };
            (_display displayCtrl (_availableSelections select _foreachIndex)) ctrlSetTextColor [_red, _green, _blue, 1.0];
        }foreach _selectionBloodLoss;

        // TODO fill the lb with the appropiate information for the patient
        _lbCtrl = (_display displayCtrl 200);
        lbClear _lbCtrl;
        {
            _lbCtrl lbAdd (_x select 0);
            _lbCtrl lbSetColor [_foreachIndex, _x select 1];
        }foreach _genericMessages;
        {
            _lbCtrl lbAdd (_x select 0);
            _lbCtrl lbSetColor [_foreachIndex, _x select 1];
        }foreach _allInjuryTexts;
        if (count _allInjuryTexts == 0) then {
            _lbCtrl lbAdd "No injuries on this bodypart..";
        };

        _logCtrl = (_display displayCtrl 302);
        lbClear _logCtrl;

        private ["_logs", "_log", "_message", "_moment", "_arguments", "_lbCtrl"];
        _logs = _target getvariable [QGVAR(logFile_Activity), []];
        {
            // [_message,_moment,_type, _arguments]
            _message = _x select 0;
            _moment = _x select 1;
            _arguments = _x select 3;
            if (isLocalized _message) then {
                _message = localize _message;
            };

            {
                if (typeName _x == "STRING" && {isLocalized _x}) then {
                    _arguments set [_foreachIndex, localize _x];
                };
            }foreach _arguments;
            _message = format([_message] + _arguments);
            _logCtrl lbAdd format["%1 %2", _moment, _message];
        }foreach _logs;

        _triageStatus = [_target] call FUNC(getTriageStatus);
        (_display displayCtrl 303) ctrlSetText (_triageStatus select 0);
        (_display displayCtrl 303) ctrlSetBackgroundColor (_triageStatus select 2);

    }, 0, [_target, GVAR(currentSelectedSelectionN)]] call CBA_fnc_addPerFrameHandler;

} else {
    ("ACE_MedicalRscDisplayInformation" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
};
