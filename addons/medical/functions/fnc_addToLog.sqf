/*
 * Author: Glowbal
 * Add an entry to the specified log
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: The log type <STRING>
 * 2: The message <STRING>
 * 3: The arguments for localization <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_moment", "_logVarName", "_log","_newLog", "_logs"];
params ["_unit", "_type", "_message", "_arguments"];

if (!local _unit) exitWith {
    [_this, QFUNC(addToLog), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};

date params ["", "", "", "_hour", "_minute"];

_moment = format [ (["%1:%2", "%1:0%2"] select (_minute < 10)), _hour, _minute];

_logVarName = format[QGVAR(logFile_%1), _type];

_log = _unit getVariable [_logVarName, []];
if (count _log >= 8) then {
    _newLog = [];
    {
        // ensure the first element will not be added
        if (_forEachIndex > 0) then {
            _newLog pushBack _x;
        };
    } forEach _log;
    _log = _newLog;
};
_log pushBack [_message, _moment, _type, _arguments];

_unit setVariable [_logVarName, _log, true];
["medical_onLogEntryAdded", [_unit, _type, _message, _arguments]] call EFUNC(common,localEvent);

_logs = _unit getVariable [QGVAR(allLogs), []];
if !(_logVarName in _logs) then {
    _logs pushBack _logVarName;
    _unit setVariable [QGVAR(allLogs), _logs, true];
};
