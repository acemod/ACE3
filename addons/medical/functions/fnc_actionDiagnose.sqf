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

_genericMessages = [STRING(diagnoseMessage)];

_genericMessages pushBack ([_target] call EFUNC(common,getName));
if (alive _target) then {
    _genericMessages pushback STRING(diagnoseAlive);
} else {
    _genericMessages pushback STRING(diagnoseDead);
};
if (_target getvariable[QGVAR(hasLostBlood), 0] > 0) then {
	if (_target getvariable[QGVAR(hasLostBlood), 0] > 1) then {
		_genericMessages pushback STRING(lostBloodALot);
	} else {
		_genericMessages pushback STRING(lostBlood);
	};
} else {
    _genericMessages pushback STRING(noBloodloss);
};

if (_target getvariable[QGVAR(hasPain), false]) then {
    _genericMessages pushback STRING(inPain);
} else {
    _genericMessages pushback STRING(noPain);
};

["displayTextStructured", [_caller], [_genericMessages, 3.0, _caller]] call EFUNC(common,targetEvent);
