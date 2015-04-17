/*
 * Author: Glowbal
 * Local callback for checking the pulse of a patient
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

_caller = _this select 0;
_unit = _this select 1;

_genericMessages = ["Patient %1<br/>is %2.<br/>%3.<br/>%4"];

_genericMessages pushBack ([_unit] call EFUNC(common,getName));
if (alive _unit) then {
    _genericMessages pushback "alive";
} else {
    _genericMessages pushback "dead";
};
if (_target getvariable[QGVAR(hasLostBlood), false]) then {
    _genericMessages pushback "He's lost some blood";
} else {
    _genericMessages pushback "He hasn't lost blood";
};

if (_target getvariable[QGVAR(hasPain), false]) then {
    _genericMessages pushback "He is in pain";
} else {
    _genericMessages pushback "He is not in pain";
};
diag_log _genericMessages;
["displayTextStructured", [_caller], [format _genericMessages, 3.0, _caller]] call EFUNC(common,targetEvent);
