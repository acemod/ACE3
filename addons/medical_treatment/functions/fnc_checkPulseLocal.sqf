#include "script_component.hpp"
/*
 * Author: Glowbal
 * Local callback for checking the pulse or heart rate of a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Head"] call ace_medical_treatment_fnc_checkPulseLocal
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _heartRate = 0;

if (alive _patient && {!([_patient, _bodyPart] call FUNC(hasTourniquetAppliedTo))}) then {
    _heartRate = GET_HEART_RATE(_patient);
};

private _heartRateOutput = LSTRING(Check_Pulse_Output_5);
private _logOutput = LSTRING(Check_Pulse_None);

if (_heartRate > 1) then {
    if (_medic call FUNC(isMedic)) then {
        _heartRateOutput = LSTRING(Check_Pulse_Output_1);
        _logOutput = format ["%1", round _heartRate];
    } else {
        _heartRateOutput = LSTRING(Check_Pulse_Output_2);
        _logOutput = LSTRING(Check_Pulse_Weak);

        if (_heartRate > 60) then {
            if (_heartRate > 100) then {
                _heartRateOutput = LSTRING(Check_Pulse_Output_3);
                _logOutput = LSTRING(Check_Pulse_Strong);
            } else {
                _heartRateOutput = LSTRING(Check_Pulse_Output_4);
                _logOutput = LSTRING(Check_Pulse_Normal);
            };
        };
    };
};

[_patient, "quick_view", LSTRING(Check_Pulse_Log), [_medic call EFUNC(common,getName), _logOutput]] call FUNC(addToLog);

[QEGVAR(common,displayTextStructured), [[_heartRateOutput, _patient call EFUNC(common,getName), round _heartRate], 1.5, _medic], _medic] call CBA_fnc_targetEvent;
