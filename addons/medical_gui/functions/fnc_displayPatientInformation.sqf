#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Opens the patient information display for given target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Body part <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, 0] call ace_medical_gui_fnc_displayPatientInformation
 *
 * Public: No
 */

#define MAX_DISTANCE 4

params ["_target", "_selectionN"];

private _display = uiNamespace getVariable [QGVAR(RscPatientInfo), displayNull];

if (isNull _display) then {
    QGVAR(RscPatientInfo) cutRsc [QGVAR(RscPatientInfo), "PLAIN", -1, false];
    _display = uiNamespace getVariable [QGVAR(RscPatientInfo), displayNull];

    [{
        params ["_display", "_pfhID"];

        if (isNull _display) exitWith {
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };

        private _target = _display getVariable [QGVAR(target), objNull];
        private _selectionN = _display getVariable [QGVAR(selectionN), 0];

        // Close display if target moved too far away (ignore if in same vehicle)
        if (ACE_player distance _target > MAX_DISTANCE && {vehicle _target != vehicle ACE_player}) exitWith {
            [_pfhID] call CBA_fnc_removePerFrameHandler;
            QGVAR(RscPatientInfo) cutFadeOut 0.3;
            [[ELSTRING(medical,DistanceToFar), _target call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);
        };

        // Update body image
        private _ctrlBodyImage = _display displayCtrl IDC_BODY_GROUP;
        [_ctrlBodyImage, _target] call FUNC(updateBodyImage);

        // Update injury list
        private _ctrlInjuries = _display displayCtrl IDC_INJURIES;
        [_ctrlInjuries, _target, _selectionN] call FUNC(updateInjuryList);

        // Update activity log
        private _ctrlActivityLog = _display displayCtrl IDC_ACTIVITY;
        private _activityLog = _target getVariable [MED_LOG_VARNAME("activity"), []];
        [_ctrlActivityLog, _activityLog] call FUNC(updateLogList);

        // Update triage status
        [_display, _target] call FUNC(updateTriageStatus);
    }, 0, _display] call CBA_fnc_addPerFrameHandler;
};

_display setVariable [QGVAR(target), _target];
_display setVariable [QGVAR(selectionN), _selectionN];
