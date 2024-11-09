#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the progress of pulse checking.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Medic (not used) <OBJECT>
 * - 1: Patient <OBJECT>
 *
 * Return Value:
 * Continue pulse checking <BOOL>
 *
 * Example:
 * [[player, cursorObject]] call ace_medical_treatment_fnc_checkPulseProgress
 *
 * Public: No
 */

if (!GVAR(enableRealisticPulseChecking)) exitWith {true};

(_this select 0) params ["", "_patient"];

private _display = uiNamespace getVariable [QGVAR(checkPulseDisplay), displayNull];

if (isNull _display) then {
    TRACE_1("creating display",_this);
    QGVAR(checkPulse) cutRsc [QGVAR(checkPulse), "PLAIN"];
    _display setVariable [QGVAR(lastPulse), CBA_missionTime - 0.5];
} else {
    private _pulse = GET_HEART_RATE(_patient);
    _lastPulse = _display getVariable [QGVAR(lastPulse), -1];

    private _nextPulse = _lastPulse + (if (_pulse == 0) then {1e99} else { 60 / _pulse });
    if (CBA_missionTime > _nextPulse) then { _display setVariable [QGVAR(lastPulse), _nextPulse]; };
    private _fade = (linearConversion [-0.1, 0, CBA_missionTime - _nextPulse, 0, 0.85, true] max linearConversion [0.35, 0, CBA_missionTime - _lastPulse, 0, 0.75, true]) ^ 2;

    if (EGVAR(common,epilepsyFriendlyMode)) then {
        _fade = _fade min 0.2;
    };

    private _ctrlVignette = _display displayCtrl 5000;
    _ctrlVignette ctrlSetTextColor [0, 0, 0, _fade];

    private _ctrlWatch = _display displayCtrl 5001;
    _ctrlWatch ctrlSetPosition [safeZoneX + (safeZoneW * 0.5), (ctrlPosition _ctrlWatch) select 1, safeZoneY + (safeZoneH * 0.5)];
    _ctrlWatch ctrlCommit 0;
    _ctrlWatch ctrlAnimateModel ["WatchSecond", linearConversion [0, 60, floor ((daytime * 3600) % 60), 0, 1]];
    _ctrlWatch ctrlAnimateModel ["WatchHour", (dayTime / 12) % 1];
    _ctrlWatch ctrlAnimateModel ["WatchMinute", dayTime % 1];
};

true
