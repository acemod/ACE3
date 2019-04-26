#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Adds an entry to the specified medical log of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Log Type <STRING>
 * 2: Message <STRING>
 * 3: Formatting Arguments <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "activity", "Message %1", ["Name"]] call ace_medical_treatment_fnc_addToLog
 *
 * Public: No
 */

params ["_unit", "_logType", "_message", "_arguments"];

if (!local _unit) exitWith {
    [QGVAR(addToLog), _this, _unit] call CBA_fnc_targetEvent;
};

date params ["", "", "", "_hour", "_minute"];
private _timeStamp = format ["%1:%2", _hour, [_minute, 2] call CBA_fnc_formatNumber];

private _logVarName = MED_LOG_VARNAME(_logType);
private _log = _unit getVariable [_logVarName, []];

if (count _log >= MED_LOG_MAX_ENTRIES) then {
    _log deleteAt 0;
};

_log pushBack [_message, _timeStamp, _arguments, _logType];
_unit setVariable [_logVarName, _log, true];

private _allLogs = _unit getVariable [QEGVAR(medical,allLogs), []];

if !(_logVarName in _allLogs) then {
    _allLogs pushBack _logVarName;
    _unit setVariable [QEGVAR(medical,allLogs), _allLogs, true];
};
