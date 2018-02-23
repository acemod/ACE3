/*
 * Author: PabstMirror
 * Dev function: Converts ace_settings to code, outputs to clipboard
 *
 * Arguments:
 * 0: Addon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ace_weaponselect"] call ace_common_fnc_cbaSettings_convertHelper
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_addon"];

private _output = [format ["// CBA Settings [ADDON: %1]:", _addon]];

private _addonSearch = _addon + "_";
private _addonSearchCount = count _addonSearch;
TRACE_2("",_addonSearch, _addonSearchCount);

private _settings = configProperties [configFile >> "ACE_Settings", "(isClass _x) && {((configName _x) select [0, _addonSearchCount]) == _addonSearch}"];

{
    private _config = _x;
    private _varName = configName _config;
    private _typeName = toUpper getText (_config >> "typeName");
    if (_typeName == "") then {
        WARNING_1("Setting [%1] Has no typeName",_varName);
        _typeName = "SCALAR";
    };
    TRACE_2("loadFromConfig",_varName,_typeName);

    private _isClientSettable = (getNumber (_config >> "isClientSettable")) > 0;
    private _localizedName = getText (_config >> "displayName");
    private _localizedDescription = getText (_config >> "description");
    private _isForced = (getNumber (_config >> "force")) > 0;
    private _category = getText (_config >> "category");

    private _cbaIsGlobal = (!_isClientSettable) || _isForced;
    if (_isForced) then {GVAR(cbaSettings_forcedSettings) pushBack (toLower _varName);};

    // Basic handling of setting types CBA doesn't support:
    if (_typeName == "ARRAY") exitWith {
        WARNING_1("Setting [%1] is type ARRAY - limited support",_varName);
        private _value = getArray (_config >> "value");
        if (isServer) then {missionNamespace setVariable [_varName, _value, true];};
    };

    private _cbaSettingType = "";
    private _cbaValueInfo = [];
    _cbaValueInfoHint = "default value";
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
                _cbaValueInfoHint = "[values, titles, defaultIndex]";
            } else {
                _cbaSettingType = "SLIDER"; // [_min, _max, _default, _trailingDecimals]
                _cbaValueInfo = if (isArray (_config >> "sliderSettings")) then {
                    getArray (_config >> "sliderSettings");
                } else {
                    [-1, 5000, 0, 1]
                };
                _cbaValueInfo set [2, getNumber (_config >> "value")];
                _cbaValueInfoHint = "[min, max, default value, trailing decimals (-1 for whole numbers only)]";
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
        WARNING_1("Setting [%1] - no category",_varName);
        _category = "Uncategorized";
    };
    private _uncat = false;
    if (((_varName select [0, 4]) == "ACE_") && {(_category select [0, 3]) != "ACE"}) then {_uncat = true; _category = format ["ACE %1", _category];};
    if (((_varName select [0, 5]) == "ACEX_") && {(_category select [0, 4]) != "ACEX"}) then {_uncat = true; _category = format ["ACEX %1", _category];};

    private _gvarName = _varName select [_addonSearchCount];

    _output pushBack "";
    _output pushBack format ["["];
    _output pushBack format ["    QGVAR(%1), ""%2"",", _gvarName, _cbaSettingType];
    _output pushBack format ["    [LSTRING(), LSTRING()], // %1, %2", _localizedName, _localizedDescription];
    _output pushBack format ["    ""%1"", // %2", ["localize LSTRING()", _category] select _uncat, _category];
    _output pushBack format ["    %1, // %2", _cbaValueInfo, _cbaValueInfoHint];
    _output pushBack format ["    %1, // isGlobal", _cbaIsGlobal];
    if ((_varName select [0, 4]) == "ACE_") then {
        _output pushBack format ["    {[QGVAR(%1), _this] call EFUNC(common,cbaSettings_settingChanged)}", _gvarName];
    } else {
        _output pushBack format ["    {[""%1"", _this] call ace_common_fnc_cbaSettings_settingChanged}", _varName];
    };
    _output pushBack "] call CBA_settings_fnc_init;";
} forEach _settings;

copyToClipboard (_output joinString endl);

INFO_1("Settings sqf copied to clipboard for %1",_addon);
