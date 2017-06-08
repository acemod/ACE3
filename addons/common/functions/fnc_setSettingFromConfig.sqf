/*
 * Author: esteldunedain
 * Load a setting from config if it was not previosuly forced. Force if neccesary.
 *
 * Arguments:
 * 0: Config entry <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONFIG] call ace_common_fnc_setSettingFromConfig
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_optionEntry"];

private _fnc_getValueWithType = {
    params ["_optionEntry", "_typeName"];

    private _valueConfig = (_optionEntry >> "value");
    private _value = if (isNumber (_optionEntry >> "value")) then {getNumber (_optionEntry >> "value")} else {0};
    TRACE_3("_fnc_getValueWithType:", configName _optionEntry, _typeName, _value);
    if (_typeName == "BOOL") exitWith {
        _value > 0
    };
    if (_typeName == "STRING") exitWith {
        getText (_optionEntry >> "value")
    };
    if (_typeName == "ARRAY") exitWith {
        getArray (_optionEntry >> "value")
    };
    if (_typeName == "COLOR") exitWith {
        getArray (_optionEntry >> "value")
    };
    _value
};

private _name = configName _optionEntry;

// Check if the variable is already defined
if (isNil _name) then {
    // That setting was not loaded yet

    // Get type from config
    private _typeName = getText (_optionEntry >> "typeName");
    if (_typeName == "") then {
        _typeName = "SCALAR";
    };

    // Read entry and cast it to the correct type
    private _value = [_optionEntry, _typeName] call _fnc_getValueWithType;

    // Init the variable
    missionNamespace setVariable [_name, _value];

    // Add the setting to a list on the server
    // Set the variable to not forced
    /*private _settingData = [
        name,
        typeName,
        isClientSettable,
        localizedName,
        localizedDescription,
        possibleValues,
        isForced,
        defaultValue,
        category
    ];*/
    private _settingData = [
        _name,
        _typeName,
        (getNumber (_optionEntry >> "isClientSettable")) > 0,
        "", //getText (_optionEntry >> "displayName"), //No need to broadcast, handeled by fnc_loadSettingsLocalizedText
        "", //getText (_optionEntry >> "description"), //No need to broadcast, handeled by fnc_loadSettingsLocalizedText
        [], //getArray (_optionEntry >> "values"), //No need to broadcast, handeled by fnc_loadSettingsLocalizedText
        getNumber (_optionEntry >> "force") > 0,
        _value,
        "" //getText (_optionEntry >> "category")   //No need to broadcast, handeled by fnc_loadSettingsLocalizedText
    ];

    //Strings in the values array won't be localized from the config, so just do that now:
    /*private _values = _settingData select 5;

    {
        private _text = _x;
        if (((typeName _text) == "STRING") && {(count _text) > 1} && {(_text select [0,1]) == "$"}) then {
            _text = localize (_text select [1, ((count _text) - 1)]); //chop off the leading $
            _values set [_forEachIndex, _text];
        };
    } forEach _values;*/


    GVAR(settings) pushBack _settingData;

} else {
    // The setting already exists.

    // Check if it's already forced and quit
    private _settingData = [_name] call FUNC(getSettingData);
    if (_settingData select 6) exitWith {};

    // The setting is not forced, so update the value

    // Read entry and cast it to the correct type from the existing variable
    private _value = [_optionEntry, _settingData select 1] call _fnc_getValueWithType;

    // Update the variable
    missionNamespace setVariable [_name, _value];

    // Force the setting if requested
    if (getNumber (_optionEntry >> "force") > 0) then {
        _settingData set [6, true];
    };
};
