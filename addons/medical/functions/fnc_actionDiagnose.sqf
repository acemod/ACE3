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

private ["_caller", "_target", "_genericMessages"];
_caller = _this select 0;
_target = _this select 1;

_genericMessages = ["STR_ACE_Medical_diagnoseMessage"];

_genericMessages pushBack ([_target] call EFUNC(common,getName));
if (alive _target) then {
    _genericMessages pushback "STR_ACE_Medical_diagnoseAlive";
} else {
    _genericMessages pushback "STR_ACE_Medical_diagnoseDead";
};
if (_target getvariable[QGVAR(hasLostBlood), 0] > 0) then {
	if (_target getvariable[QGVAR(hasLostBlood), 0] > 1) then {
		_genericMessages pushback "STR_ACE_Medical_lostBloodALot";
	} else {
		_genericMessages pushback "STR_ACE_Medical_lostBlood";
	};
} else {
    _genericMessages pushback "STR_ACE_Medical_noBloodloss";
};

if (_target getvariable[QGVAR(hasPain), false]) then {
    _genericMessages pushback "STR_ACE_Medical_inPain";
} else {
    _genericMessages pushback "STR_ACE_Medical_noPain";
};

["displayTextStructured", [_caller], [_genericMessages, 3.0, _caller]] call EFUNC(common,targetEvent);
