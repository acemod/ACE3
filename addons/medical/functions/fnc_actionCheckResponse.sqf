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
    _output = format[localize "STR_ACE_CHECK_REPONSE_RESPONSIVE",[_target] call EFUNC(common,getName)];
} else {
    _output = format[localize "STR_ACE_CHECK_REPONSE_UNRESPONSIVE",[_target] call EFUNC(common,getName)];
};

[_output] call EFUNC(common,displayTextStructured);
[_target,"examine",_output] call FUNC(addToLog);
