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
 * Example:
 * [bob, "type", "message", [_args]] call ace_medical_fnc_addToLog
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", "_type", "_message", "_arguments"];

if (!local _unit) exitWith {
    [QGVAR(addToMedicalLog), _this, _unit] call CBA_fnc_targetEvent;
};

date params ["", "", "", "_hour", "_minute"];

private _moment = format [ (["%1:%2", "%1:0%2"] select (_minute < 10)), _hour, _minute];
private _logVarName = format[QGVAR(logFile_%1), _type];

private _log = _unit getVariable [_logVarName, []];
if (count _log >= 8) then {
    private _newLog = [];
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
["ace_medicalLogEntryAdded", [_unit, _type, _message, _arguments]] call CBA_fnc_localEvent;

private _logs = _unit getVariable [QGVAR(allLogs), []];
if !(_logVarName in _logs) then {
    _logs pushBack _logVarName;
    _unit setVariable [QGVAR(allLogs), _logs, true];
};
