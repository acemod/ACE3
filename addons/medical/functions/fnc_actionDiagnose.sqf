/*
* Author: Glowbal
* Action for diagnosing in basic medical
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

private "_genericMessages";
params ["_caller", "_target"];

_genericMessages = [LSTRING(diagnoseMessage)];

_genericMessages pushBack ([_target] call EFUNC(common,getName));
if (alive _target) then {
    _genericMessages pushBack LSTRING(diagnoseAlive);
} else {
    _genericMessages pushBack LSTRING(diagnoseDead);
};
if (_target getvariable[QGVAR(hasLostBlood), 0] > 0) then {
	if (_target getvariable[QGVAR(hasLostBlood), 0] > 1) then {
		_genericMessages pushBack LSTRING(lostBloodALot);
	} else {
		_genericMessages pushBack LSTRING(lostBlood);
	};
} else {
    _genericMessages pushBack LSTRING(noBloodloss);
};

if (alive _target) then {
    if (_target getvariable[QGVAR(hasPain), false]) then {
        _genericMessages pushBack LSTRING(inPain);
    } else {
        _genericMessages pushBack LSTRING(noPain);
    };
};

["displayTextStructured", [_caller], [_genericMessages, 3.0, _caller]] call EFUNC(common,targetEvent);
