/*
 * Author: Glowbal
 * Add an entry to the triage card
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: The new item classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit", "_newItem", "_log", "_inList", "_amount"];
_unit = _this select 0;
_newItem = _this select 1;

if (!local _unit) exitwith {
    [_this, QUOTE(DFUNC(addToTriageList)), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};

_log = _unit getvariable [QGVAR(triageCard), []];
_inList = false;
_amount = 1;
{
    if ((_x select 0) == _newItem) exitwith {
        private "_info";
        _info = _log select _foreachIndex;
        _info set [1,(_info select 1) + 1];
        _info set [2, time];
        _log set [_foreachIndex, _info];

        _amount = (_info select 1);
        _inList = true;
    };
}foreach _log;

if (!_inList) then {
    _log pushback [_newItem, 1, time];
};
_unit setvariable [QGVAR(triageCard), _log, true];
["Medical_onItemAddedToTriageCard", [_unit, _newItem, _amount]] call ace_common_fnc_localEvent;
