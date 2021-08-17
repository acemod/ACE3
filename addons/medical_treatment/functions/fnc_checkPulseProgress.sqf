#include "script_component.hpp"
/*
 * Author: Pabst Mirror
 * ok
 *
 * Arguments:
 * 0,0: Medic <OBJECT>
 * 0,1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, cursorObject]] call ace_medical_treatment_fnc_checkPulse
 *
 * Public: No
 */

(_this # 0) params ["", "_patient"];

private _display = uiNamespace getVariable [QGVAR(checkPulseDisplay), displayNull];

if (isNull _display) then {
    TRACE_1("creating display",_this);
    QGVAR(checkPulse) cutRsc [QGVAR(checkPulse), "PLAIN"];
    _display setVariable [QGVAR(lastPulse), CBA_missionTime - 0.5];
} else {
        private _pulse = GET_HEART_RATE(_patient);
        _lastPulse = _display getVariable [QGVAR(lastPulse), -1];

        private _nextPulse = _lastPulse + (if (_pulse == 0) then {1e99} else { 60 / _pulse });
        if (time > _nextPulse) then { _display setVariable [QGVAR(lastPulse), _nextPulse]; };
        private _fade = (linearConversion [-.1, 0, CBA_missionTime - _nextPulse, 0, 0.85, true] max linearConversion [0.35, 0, CBA_missionTime - _lastPulse, 0, 0.75, true]) ^ 2;

        private _ctrlVignette = _display displayCtrl 5000;
        _ctrlVignette ctrlSetTextColor [0,0,0,_fade];

        private _ctrlWatch = _display displayCtrl 5001;
        _ctrlWatch ctrlSetPosition [safeZoneX + (safeZoneW * 0.5), (ctrlPosition _ctrlWatch) # 1, safeZoneY + (safeZoneH * 0.5)];
        _ctrlWatch ctrlCommit 0;
        _ctrlWatch ctrlAnimateModel ["WatchSecond", linearConversion [0, 60, floor ((daytime * 3600) % 60), 0, 1]];
        _ctrlWatch ctrlAnimateModel ["WatchHour", (daytime / 12) % 1];
        _ctrlWatch ctrlAnimateModel ["WatchMinute", daytime % 1];
};


true
