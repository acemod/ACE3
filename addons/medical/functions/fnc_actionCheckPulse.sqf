/*
* Author: Glowbal
* Action for checking the pulse or heart rate of the patient
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
[[_caller, _target], QUOTE(DFUNC(actionCheckPulseLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
