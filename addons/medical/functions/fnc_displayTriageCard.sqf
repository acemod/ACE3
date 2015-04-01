/*
 * Author: Glowbal
 * Display triage card for a unit
 *
 * Arguments:
 * 0: The unit <OBJECT>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_target", "_show"];
_target = _this select 0;
_show = if (count _this > 1) then {_this select 1} else {true};
GVAR(currentSelectedSelectionN) = if (count _this > 2) then {_this select 2} else {0};

GVAR(TriageCardTarget) = if (_show) then {_target} else {ObjNull};

if (_show) then {
    //("ACE_MedicalTriageCard" call BIS_fnc_rscLayer) cutRsc [QGVAR(triageCard),"PLAIN"];
    createDialog QGVAR(triageCard);

    [{
        private ["_target", "_display", "_alphaLevel", "_damaged", "_availableSelections", "_openWounds", "_selectionBloodLoss", "_red", "_green", "_blue", "_alphaLevel", "_allInjuryTexts", "_lbCtrl", "_genericMessages"];
        _target = (_this select 0) select 0;
        if (GVAR(TriageCardTarget) != _target) exitwith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        disableSerialization;
        _display = uiNamespace getvariable QGVAR(triageCard);
        if (isnil "_display") exitwith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        _triageCardTexts = [];

        // TODO fill the lb with the appropiate information for the patient
        _lbCtrl = (_display displayCtrl 200);
        lbClear _lbCtrl;

        _log = _target getvariable ["myVariableTESTKOEAKJR", []];
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
            _lbCtrl lbAdd format["%1 %2", _moment, _message];
        }foreach _log;

        if (count _triageCardTexts == 0) then {
            _lbCtrl lbAdd "No entries on this triage card..";
        };

        _triageStatus = [_target] call FUNC(getTriageStatus);
        (_display displayCtrl 2000) ctrlSetText (_triageStatus select 0);
        (_display displayCtrl 2000) ctrlSetBackgroundColor (_triageStatus select 2);

    }, 0, [_target]] call CBA_fnc_addPerFrameHandler;

} else {
    //("ACE_MedicalTriageCard" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
    closeDialog 7010;
};
