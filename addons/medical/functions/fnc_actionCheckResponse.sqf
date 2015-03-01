/*
 * Author: Glowbal
 * Action for checking the response status of the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller","_target"];
_caller = _this select 0;
_target = _this select 1;

_output = "";
if ([_target] call EFUNC(common,isAwake)) then {
    _output = ["STR_ACE_CHECK_REPONSE_RESPONSIVE",[_target] call EFUNC(common,getName)];
} else {
    _output = ["STR_ACE_CHECK_REPONSE_UNRESPONSIVE",[_target] call EFUNC(common,getName)];
};

["displayTextStructured", [_caller], [_output, 1.5, _caller]] call EFUNC(common,targetEvent);

[_target,"examine",_output] call FUNC(addToLog);
