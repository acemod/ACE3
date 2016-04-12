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

_output = [LSTRING(Check_Response_Unresponsive), LSTRING(Check_Response_Responsive)] select ([_target] call CFUNC(isAwake));

["displayTextStructured", [_caller], [[_output, [_target] call CFUNC(getName)], 2, _caller]] call CFUNC(targetEvent);

[_target,"activity",_output, [[_target, false, true] call CFUNC(getName)]] call FUNC(addToLog);
[_target,"quick_view",_output, [[_target, false, true] call CFUNC(getName)]] call FUNC(addToLog);
