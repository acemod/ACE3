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
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit", "_type", "_message", "_arguments", "_lastNumber", "_moment", "_logVarName", "_log","_newLog", "_logs"];
_unit = _this select 0;
_type = _this select 1;
_message = _this select 2;
_arguments = _this select 3;

if (!local _unit) exitwith {
    [_this, QUOTE(DFUNC(addToLog)), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
};

_lastNumber = date select 4;
_moment = format["%1:%2",date select 3, _lastNumber];
if (_lastNumber < 10) then {
    _moment = format["%1:0%2",date select 3, _lastNumber];
};
_logVarName = format[QGVAR(logFile_%1), _type];

_log = _unit getvariable [_logVarName, []];
if (count _log >= 8) then {
    _newLog = [];
    {
        // ensure the first element will not be added
        if (_foreachIndex > 0) then {
            _newLog pushback _x;
        };
    }foreach _log;
    _log = _newLog;
};
_log pushback [_message,_moment,_type, _arguments];

_unit setvariable [_logVarName, _log, true];
["medical_onLogEntryAdded", [_unit, _type, _message, _arguments]] call EFUNC(common,localEvent);

_logs = _unit getvariable [QGVAR(allLogs), []];
if !(_logVarName in _logs) then {
    _logs pushback _logVarName;
    _unit setvariable [QGVAR(allLogs), _logs, true];
};
