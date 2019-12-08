#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Converts a ace_setting config into a cba setting
 *
 * Arguments:
 * 0: Setting config <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_common_fnc_cbaSettings_loadFromConfig;
 *
 * Public: No
 */

params ["_config"];

private _varName = configName _config;
private _typeName = toUpper getText (_config >> "typeName");
if (_typeName == "") then {
    WARNING_1("Setting [%1] Has no typeName",_varName);
    _typeName = "SCALAR";
};
TRACE_3("loadFromConfig",_var,_typeName,_config);

private _isClientSettable = (getNumber (_config >> "isClientSettable")) > 0;
private _localizedName = getText (_config >> "displayName");
private _localizedDescription = getText (_config >> "description");
private _isForced = (getNumber (_config >> "force")) > 0;
private _category = getText (_config >> "category");

private _cbaIsGlobal = (!_isClientSettable) || _isForced;
private _warnIfChangedMidMission = _cbaIsGlobal && {(getNumber (_config >> "canBeChanged")) == 0};
if (_isForced) then {GVAR(cbaSettings_forcedSettings) pushBack (toLower _varName);};

// Basic handling of setting types CBA doesn't support:
if (_typeName == "ARRAY") exitWith {
    WARNING_1("Setting [%1] is type ARRAY - limited support",_varName);
    private _value = getArray (_config >> "value");
    if (isServer) then {missionNamespace setVariable [_varName, _value, true];};
};

private _cbaSettingType = "";
private _cbaValueInfo = [];
switch (_typeName) do {
case ("SCALAR"): { // ACE's Scalar can be a float or an index for a list
        if (!isNumber (_config >> "value")) then {WARNING_2("Setting [%1] - value type [%2] is missing number",_varName,_typeName);};
        if (isArray (_config >> "values")) then {
            _cbaSettingType = "LIST"; // [_values, _valueTitles, _defaultIndex]
            private _values = [];
            private _valueTitles = [];
            {
                _values pushBack _forEachIndex;
                _valueTitles pushBack (if ((_x select [0, 1]) == "$") then {localize (_x select [1]);} else {_x});
            } forEach (getArray (_config >> "values"));
            _cbaValueInfo = [_values, _valueTitles, getNumber (_config >> "value")];
        } else {
            _cbaSettingType = "SLIDER"; // [_min, _max, _default, _trailingDecimals]
            _cbaValueInfo = if (isArray (_config >> "sliderSettings")) then {
                getArray (_config >> "sliderSettings");
            } else {
                INFO_1("Using auto min/max for [%1]",_varName);
                [-1, 5000, 0, 1]
            };
            _cbaValueInfo set [2, getNumber (_config >> "value")];
        };
    };
case ("BOOL"): {
        if (!isNumber (_config >> "value")) then {WARNING_2("Setting [%1] - value type [%2] is missing number",_varName,_typeName);};
        _cbaSettingType = "CHECKBOX";
        _cbaValueInfo = (getNumber (_config >> "value")) > 0;
    };
case ("COLOR"): {
        if (!isArray (_config >> "value")) then {WARNING_2("Setting [%1] - value type [%2] is missing array",_varName,_typeName);};
        _cbaSettingType = "COLOR";
        _cbaValueInfo = getArray (_config >> "value");
    };
case ("STRING"): {
        if (!isText (_config >> "value")) then {WARNING_2("Setting [%1] - value type [%2] is missing text",_varName,_typeName);};
        _cbaSettingType = "EDITBOX";
        _cbaValueInfo = getText (_config >> "value");
    };
};

if (_cbaSettingType == "") exitWith {ERROR_3("Setting [%1] - value type [%2] is unknown - %3",_varName,_typeName,_cbaValueInfo);};

if (_localizedDescription == "") then {_localizedDescription = _varName};
if (_category == "") then {
    // WARNING_1("Setting [%1] - no category",_varName);
    _category = "Uncategorized";
};
if (((_varName select [0, 4]) == "ACE_") && {(_category select [0, 3]) != "ACE"}) then {_category = format ["ACE %1", _category];};
if (((_varName select [0, 5]) == "ACEX_") && {(_category select [0, 4]) != "ACEX"}) then {_category = format ["ACEX %1", _category];};

private _code = compile format ['["%1", _this] call FUNC(cbaSettings_settingChanged)', _varName];

TRACE_2("setting",_cbaSettingType,_cbaValueInfo);
TRACE_4("",_isForced,_cbaIsGlobal,_category,_cbaValueInfo);
private _return = [_varName, _cbaSettingType, [_localizedName, _localizedDescription], _category, _cbaValueInfo, _cbaIsGlobal, _code, _warnIfChangedMidMission] call CBA_settings_fnc_init;
TRACE_1("returned",_return);
if ((isNil "_return") || {_return != 0}) then {ERROR_1("Setting [%1] - CBA Error",_varName);};
_return

