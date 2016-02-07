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

params ["_caller","_target"];

if (local _target) then {
    ["actionCheckPulseLocal", [_caller, _target]] call EFUNC(common,localEvent);
} else {
    ["actionCheckPulseLocal", _target, [_caller, _target]] call EFUNC(common,targetEvent);
};
