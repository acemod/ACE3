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
 * Example:
 * [bob, "bandage"] call ace_medical_fnc_addToTriageCard
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", "_newItem"];

if (!local _unit) exitWith {
    [QGVAR(addToTriageCard), _this, _unit] call CBA_fnc_targetEvent;
};

private _log = _unit getVariable [QGVAR(triageCard), []];
private _inList = false;
private _amount = 1;
{
    if ((_x select 0) == _newItem) exitWith {
        private _info = _log select _forEachIndex;
        _info set [1,(_info select 1) + 1];
        _info set [2, CBA_missionTime];
        _log set [_forEachIndex, _info];

        _amount = (_info select 1);
        _inList = true;
    };
} forEach _log;

if (!_inList) then {
    _log pushBack [_newItem, 1, CBA_missionTime];
};
_unit setVariable [QGVAR(triageCard), _log, true];
["ace_triageCardItemAdded", [_unit, _newItem, _amount]] call CBA_fnc_localEvent;
