/*
* Author: Glowbal
* Action for checking the pulse or heart rate of the patient
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

params ["_caller","_target", "_selectionName"];
[[_caller, _target, _selectionName], QUOTE(DFUNC(actionCheckPulseLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */

