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
 * Public: No
 */
#include "script_component.hpp"

private "_fnc_parseConfigForDisplayNames";
_fnc_parseConfigForDisplayNames = {
    params ["_optionEntry"];

    if !(isClass _optionEntry) exitwith {false};

    private "_values";
    _values = getArray (_optionEntry >> "values");

    _x set [3, getText (_optionEntry >> "displayName")];
    _x set [4, getText (_optionEntry >> "description")];
    _x set [5, _values];
    _x set [8, getText (_optionEntry >> "category")];

    {
        private "_text";
        _text = _x;

        if (_text isEqualType "" && {count _text > 1} && {_text select [0, 1] == "$"}) then {
            _text = localize (_text select [1]); //chop off the leading $
            _values set [_forEachIndex, _text];
        };
    } forEach _values;
    true
};

// Iterate through settings
{
    _x params ["_name"];

    if !([configFile >> "ACE_Settings" >> _name] call _fnc_parseConfigForDisplayNames) then {
        if !([configFile >> "ACE_ServerSettings" >> _name] call _fnc_parseConfigForDisplayNames) then {
            if !([missionConfigFile >> "ACE_Settings" >> _name] call _fnc_parseConfigForDisplayNames) then {
                ACE_LOGWARNING_1("Setting found, but couldn't localize [%1] (server has but we don't?)",_name);
            };
        };
    };
    false
} count GVAR(settings);
