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

_output = [LSTRING(Check_Response_Unresponsive), LSTRING(Check_Response_Responsive)] select ([_target] call EFUNC(common,isAwake));

["displayTextStructured", [_caller], [[_output, [_target] call EFUNC(common,getName)], 2, _caller]] call EFUNC(common,targetEvent);

[_target,"activity",_output, [[_target] call EFUNC(common,getName)]] call FUNC(addToLog);
[_target,"quick_view",_output, [[_target] call EFUNC(common,getName)]] call FUNC(addToLog);
