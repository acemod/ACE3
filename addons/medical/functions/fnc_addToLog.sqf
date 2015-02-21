/**
 * fn_addActivityToLog.sqf
 * @Descr: adds an item to the activity log
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, type STRING, message STRING]
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_type", "_message", "_arguments", "_lastNumber", "_moment", "_logVarName", "_log","_newLog"];
_unit = _this select 0;
_type = _this select 1;
_message = _this select 2;
_arguments = _this select 3;

if (!local _unit) exitwith {
    [_this, QUOTE(FUNC(addToLog)), _unit] call EFUNC(common,execRemoteFnc);
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
["medical_onLogEntryAdded", [_unit, _type, _message, _arguments]] call ace_common_fnc_localEvent;
