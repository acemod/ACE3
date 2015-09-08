/*
 * Author: commy2
 * Export Config Entrys to RPT logs
 *
 * Arguments:
 * Config Path <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [(configFile >> "CfgAmmo")] call ace_common_fnc_exportConfig;
 *
 * Public: No
 */
#include "script_component.hpp"

private "_fnc_logEntries";

_fnc_logEntries = {
    private ["_p", "_t", "_e", "_a", "_i"];

    params ["_c", "_d"];

    _p = inheritsFrom _c;

    _t = format [["class %1: %2 {", "class %1 {"] select (configName _p == ""), configName _c, configName _p];
    for "_a" from 1 to _d do {
        _t = "  " + _t;
    };
    diag_log text _t;

    _e = [];
    for "_i" from 0 to (count _c - 1) do {
        private ["_e1, _e2"];
        _e1 = _c select _i;

        _e2 = call {
            if (isNumber _e1) exitWith {getNumber _e1};
            if (isText _e1) exitWith {getText _e1};
            if (isArray _e1) exitWith {getArray _e1};
            if (isClass _e1) exitWith {[_e1, _d + 1] call _fnc_logEntries; false};
        };

        if (typeName _e2 != "BOOL") then {
            if (typeName _e2 == "ARRAY") then {
                _e2 = toArray str _e2;
                {
                    if (_x == toArray "[" select 0) then {
                        _e2 set [_forEachIndex, toArray "{" select 0];
                    };
                    if (_x == toArray "]" select 0) then {
                        _e2 set [_forEachIndex, toArray "}" select 0];
                    };
                } forEach _e2;
                _e2 = toString _e2;
                _t = format ["%1[] = %2;", configName _e1, _e2];
            } else {
                _t = format ["%1 = %2;", configName _e1, str _e2];
            };
            for "_a" from 0 to _d do {
                _t = "  " + _t;
            };
            diag_log text _t;
        };
    };

    _t = "};";
    for "_a" from 1 to _d do {
        _t = "  " + _t;
    };
    diag_log text _t;
    diag_log text "";
};

[_this, 0] call _fnc_logEntries;
