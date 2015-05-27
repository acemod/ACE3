/*
 * Author: Glowbal
 * Export all config settings with their current values.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_exportSettings
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_compiledConfig", "_name", "_typeName", "_isClientSetable", "_localizedName", "_localizedDescription", "_possibleValues", "_defaultValue", "_value", "_compiledConfigEntry"];

_compiledConfig = "
";
{
     /*_settingData = [
        _name,
        _typeName,
        _isClientSetable,
        _localizedName,
        _localizedDescription,
        _possibleValues,
        _isForced,
        _defaultValue
    ];*/

    _name = _x select 0;
    _typeName = _x select 1;
    _isClientSetable = _x select 2;
    _localizedName = _x select 3;
    _localizedDescription = _x select 4;
    _possibleValues = _x select 5;
    _defaultValue = _x select 6;

    if (GVAR(ClientSettingsExportIncluded) || !_isClientSetable) then {
        _value = missionNamespace getvariable [_name, _defaultValue];
        if (_typeName == "STRING") then { // I dont think we have string values, but just in case
            _value = format['"%1"', _value];
        };
        if (_typeName == "BOOL") then {
            _value = if (typeName _value == "BOOL" && {_value}) then {1} else {0};
        };
        _compiledConfigEntry = format ["
class %1 {
    value = %2;
    typeName = %3;
    force = 1;
};", _name, _value, format['"%1"', _typeName]];

        _compiledConfig = _compiledConfig + _compiledConfigEntry;
    };
} forEach EGVAR(common,settings);

FUNC(clipboardExport) = {
    private["_chunks"];
    _chunks = [];
    
    _chunks = [_this select 0, ";"] call CBA_fnc_split;
    
    {
        private["_chunk"];
        _chunk = _x + ";";
        "ace_clipboard" callExtension format["%1", _chunk];
    } forEach _chunks;
    
    "ace_clipboard" callExtension "--COMPLETE--";
};
[_compiledConfig] call FUNC(clipboardExport);

[STRING(settingsExported)] call EFUNC(common,displayTextStructured);


