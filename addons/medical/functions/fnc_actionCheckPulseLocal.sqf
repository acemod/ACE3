/*
 * Author: Glowbal
 * Local callback for checking the pulse of a patient
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

private ["_heartRateOutput", "_heartRate", "_logOutPut"];
params ["_caller", "_unit"];


_heartRate = _unit getvariable [QGVAR(heartRate), 80];
if (!alive _unit) then {
    _heartRate = 0;
};
_heartRateOutput = LSTRING(Check_Pulse_Output_5);
_logOutPut = LSTRING(Check_Pulse_None);

if (_heartRate > 1.0) then {
    if ([_caller] call FUNC(isMedic)) then {
        _heartRateOutput = LSTRING(Check_Pulse_Output_1);
        _logOutPut = format["%1",round(_heartRate)];
    } else {
        // non medical personel will only find a pulse/HR
        _heartRateOutput = LSTRING(Check_Pulse_Output_2);
        _logOutPut = LSTRING(Check_Pulse_Weak);
        if (_heartRate > 60) then {
            if (_heartRate > 100) then {
                _heartRateOutput = LSTRING(Check_Pulse_Output_3);
                _logOutPut = LSTRING(Check_Pulse_Strong);
            } else {
                _heartRateOutput = LSTRING(Check_Pulse_Output_4);
                _logOutPut = LSTRING(Check_Pulse_Normal);
            };
        };
    };
};

["displayTextStructured", [_caller], [[_heartRateOutput, [_unit] call EFUNC(common,getName), round(_heartRate)], 1.5, _caller]] call EFUNC(common,targetEvent);

if (_logOutPut != "") then {
    [_unit,"activity", LSTRING(Check_Pulse_Log),[[_caller] call EFUNC(common,getName),_logOutPut]] call FUNC(addToLog);
    [_unit,"quick_view", LSTRING(Check_Pulse_Log),[[_caller] call EFUNC(common,getName),_logOutPut]] call FUNC(addToLog);
};
