/*
 * Author: Glowbal
 * Local callback for checking the blood pressure of a patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_bloodPressure", "_logOutPut", "_output"];
params ["_caller", "_target", "_selectionName"];

_bloodPressure = if (!alive _target) then {
    [0,0]
} else {
    [_target] call FUNC(getBloodPressure)
};
_bloodPressure params [ "_bloodPressureLow", "_bloodPressureHigh"];
_output = "";
_logOutPut = "";
if ([_caller] call FUNC(isMedic)) then {
    _output = LSTRING(Check_Bloodpressure_Output_1);
    _logOutPut = format["%1/%2",round(_bloodPressureHigh),round(_bloodPressureLow)];
} else {
    if (_bloodPressureHigh > 20) then {
        _output = LSTRING(Check_Bloodpressure_Output_2);
        _logOutPut = LSTRING(Check_Bloodpressure_Low);
        if (_bloodPressureHigh > 100) then {
            _output = LSTRING(Check_Bloodpressure_Output_3);
            _logOutPut = LSTRING(Check_Bloodpressure_Normal);
            if (_bloodPressureHigh > 160) then {
                _output = LSTRING(Check_Bloodpressure_Output_4);
                _logOutPut = LSTRING(Check_Bloodpressure_High);
            };

        };
    } else {
        if (random(10) > 3) then {
            _output = LSTRING(Check_Bloodpressure_Output_5);
            _logOutPut = LSTRING(Check_Bloodpressure_NoBloodpressure);
        } else {
            _output = LSTRING(Check_Bloodpressure_Output_6);
            //Fail to find pressure, no logoutput
        };
    };
};

if (_selectionName in ["hand_l","hand_r"] && {[_unit, _selectionName] call FUNC(hasTourniquetAppliedTo)}) then {
    _output = LSTRING(Check_Bloodpressure_Output_6);
    _logOutPut = "";
};

["displayTextStructured", [_caller], [[_output, [_target] call EFUNC(common,getName), round(_bloodPressureHigh),round(_bloodPressureLow)], 1.75, _caller]] call EFUNC(common,targetEvent);

if (_logOutPut != "") then {
    [_target,"activity", LSTRING(Check_Bloodpressure_Log), [[_caller] call EFUNC(common,getName), _logOutPut]] call FUNC(addToLog);
    [_target,"quick_view", LSTRING(Check_Bloodpressure_Log), [[_caller] call EFUNC(common,getName), _logOutPut]] call FUNC(addToLog);
};
