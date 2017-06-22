/*
 * Author: Glowbal
 * Parse all settings and load the localized displayName and description for all text
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_loadSettingsLocalizedText
 *
 * Public: No
 */
#include "script_component.hpp"

private _fnc_parseConfigForDisplayNames = {
    params ["_optionEntry"];

    if !(isClass _optionEntry) exitWith {false};

    private _values = getArray (_optionEntry >> "values");

    _x set [3, getText (_optionEntry >> "displayName")];
    _x set [4, getText (_optionEntry >> "description")];
    _x set [5, _values];
    _x set [8, getText (_optionEntry >> "category")];

    {
        private _text = _x;

        if (_text isEqualType "" && {count _text > 1} && {_text select [0, 1] == "$"}) then {
            _text = localize (_text select [1]); //chop off the leading $
            _values set [_forEachIndex, _text];
        };
    } forEach _values;

    if (!(_values isEqualTo [])) then {
        if (_typeOf != "SCALAR") then {
            WARNING_2("Setting [%1] has values[] but is not SCALAR (%2)", _name, _typeOf);
        } else {
            private _value = missionNamespace getVariable [_name, -1];
            if ((_value < 0) || {_value >= (count _values)}) then {
                WARNING_3("Setting [%1] out of bounds %2 (values[] count is %3)", _name, _value, count _values);
            };
        };
    };
    true
};

// Iterate through settings
{
    _x params ["_name", "_typeOf"];

    if !([configFile >> "ACE_Settings" >> _name] call _fnc_parseConfigForDisplayNames) then {
        if !([configFile >> "ACE_ServerSettings" >> _name] call _fnc_parseConfigForDisplayNames) then {
            if !([missionConfigFile >> "ACE_Settings" >> _name] call _fnc_parseConfigForDisplayNames) then {
                WARNING_1("Setting found, but couldn't localize [%1] (server has but we don't?)",_name);
            };
        };
    };
    false
} count GVAR(settings);
