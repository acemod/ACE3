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

_genericMessages = ["STR_ACE_MEDICAL_diagnoseMessage"];

_genericMessages pushBack ([_target] call EFUNC(common,getName));
if (alive _target) then {
    _genericMessages pushback "STR_ACE_MEDICAL_diagnoseAlive";
} else {
    _genericMessages pushback "STR_ACE_MEDICAL_diagnoseDead";
};
if (_target getvariable[QGVAR(hasLostBlood), false]) then {
    _genericMessages pushback "STR_ACE_MEDICAL_lostBlood";
} else {
    _genericMessages pushback "STR_ACE_MEDICAL_noBloodloss";
};

if (_target getvariable[QGVAR(hasPain), false]) then {
    _genericMessages pushback "STR_ACE_MEDICAL_inPain";
} else {
    _genericMessages pushback "STR_ACE_MEDICAL_noPain";
};

["displayTextStructured", [_caller], [_genericMessages, 3.0, _caller]] call EFUNC(common,targetEvent);
