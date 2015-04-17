/*
* Author: Glowbal
* Action for diagnosing in basic medical
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

private ["_caller","_target","_title","_content"];
_caller = _this select 0;
_target = _this select 1;
[[_caller, _target], QUOTE(DFUNC(actionDiagnoseLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
