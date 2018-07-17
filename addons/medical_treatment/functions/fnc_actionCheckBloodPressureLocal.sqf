/*
 * Author: Glowbal
 * Local callback for checking the blood pressure of a patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target", "_bodyPart"];

private _bloodPressure = [0, 0];

if (alive _target && !([_target, _bodyPart] call FUNC(hasTourniquetAppliedTo))) then {
    _bloodPressure = GET_BLOOD_PRESSURE(_target);
};

private _bloodPressureOutput = ELSTRING(medical,Check_Bloodpressure_Output_6);
private _logOutPut = ELSTRING(medical,Check_Bloodpressure_NoBloodpressure);

_bloodPressure params ["_bloodPressureLow", "_bloodPressureHigh"];

if (_bloodPressureHigh > 20) then {
    if (_caller call FUNC(isMedic)) then {
        _bloodPressureOutput = ELSTRING(medical,Check_Bloodpressure_Output_1);
        _logOutPut = format ["%1/%2", round _bloodPressureHigh, round _bloodPressureLow];
    } else {
        if (_bloodPressureHigh > 20) then {
            _bloodPressureOutput = ELSTRING(medical,Check_Bloodpressure_Output_2);
            _logOutPut = ELSTRING(medical,Check_Bloodpressure_Low);

            if (_bloodPressureHigh > 100) then {
                _bloodPressureOutput = ELSTRING(medical,Check_Bloodpressure_Output_3);
                _logOutPut = ELSTRING(medical,Check_Bloodpressure_Normal);

                if (_bloodPressureHigh > 160) then {
                    _bloodPressureOutput = ELSTRING(medical,Check_Bloodpressure_Output_4);
                    _logOutPut = ELSTRING(medical,Check_Bloodpressure_High);
                };
            };
        };
    };
};

[QEGVAR(common,displayTextStructured), [[_bloodPressureOutput, _target call EFUNC(common,getName), round _bloodPressureHigh, round _bloodPressureLow], 1.75, _caller], _caller] call CBA_fnc_targetEvent;

if (_logOutPut != "") then {
    [_target, "activity", ELSTRING(medical,Check_Bloodpressure_Log), [_caller call EFUNC(common,getName), _logOutPut]] call FUNC(addToLog);
    [_target, "quick_view", ELSTRING(medical,Check_Bloodpressure_Log), [_caller call EFUNC(common,getName), _logOutPut]] call FUNC(addToLog);
};
