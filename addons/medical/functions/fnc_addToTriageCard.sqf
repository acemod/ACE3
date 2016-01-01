/*
 * Author: Glowbal
 * Add an entry to the triage card
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: The new item classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_log", "_inList", "_amount"];
params ["_unit", "_newItem"];

if (!local _unit) exitWith {
    [_this, QUOTE(DFUNC(addToTriageCard)), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};

_log = _unit getVariable [QGVAR(triageCard), []];
_inList = false;
_amount = 1;
{
    if ((_x select 0) == _newItem) exitWith {
        private "_info";
        _info = _log select _forEachIndex;
        _info set [1,(_info select 1) + 1];
        _info set [2, ACE_gameTime];
        _log set [_forEachIndex, _info];

        _amount = (_info select 1);
        _inList = true;
    };
} forEach _log;

if (!_inList) then {
    _log pushBack [_newItem, 1, ACE_gameTime];
};
_unit setVariable [QGVAR(triageCard), _log, true];
["Medical_onItemAddedToTriageCard", [_unit, _newItem, _amount]] call EFUNC(common,localEvent);
