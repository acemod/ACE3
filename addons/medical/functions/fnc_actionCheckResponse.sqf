/*
 * Author: Glowbal
 * Action for checking the response status of the patient
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

private ["_output"];
params ["_caller", "_target"];

_output = if ([_target] call EFUNC(common,isAwake)) then {
    LSTRING(Check_Response_Responsive)
} else {
    LSTRING(Check_Response_Unresponsive)
};

["displayTextStructured", [_caller], [[_output, [_target] call EFUNC(common,getName)], 2, _caller]] call EFUNC(common,targetEvent);

[_target,"activity",_output, [[_target] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target,"quick_view",_output, [[_target] call EFUNC(common,getName)]] call FUNC(addToLog);
