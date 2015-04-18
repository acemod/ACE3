/*
 * Author: esteldunedain
 * Load the user setable settings from the user profile.
 * Config < Server UserConfig < Mission Config < Client settings
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

private ["_parseConfigForDisplayNames", "_name", "_isClientSetable", "_isForced", "_profileValue"];

_parseConfigForDisplayNames = {
    private "_optionEntry";
    _optionEntry = _this select 0;
    if !(isClass _optionEntry) exitwith {false};
    _x set [3, getText (_optionEntry >> "displayName")];
    _x set [4, getText (_optionEntry >> "description")];

    private "_values";
    _values = _x select 5;
    {
        private "_text";
        _text = _x;
        if (((typeName _text) == "STRING") && {(count _text) > 1} && {(_text select [0,1]) == "$"}) then {
            _text = localize (_text select [1, ((count _text) - 1)]); //chop off the leading $
            _values set [_forEachIndex, _text];
        };
    } forEach _values;
    true;
};


// Iterate through settings
{
    _name = _x select 0;
    _isClientSetable = _x select 2;
    _isForced = _x select 6;

    // If setting is user setable
    if (_isClientSetable) then {
        // If setting is not forced
        if !(_isForced) then {
            _profileValue = profileNamespace getvariable _name;
            // If the setting is stored on the profile
            if !(isNil "_profileValue") then {
                // If the profile variable has the correct type
                if (typeName _profileValue == typeName (missionNamespace getvariable _name)) then {
                    // Load the setting from the profile
                    missionNamespace setvariable [_name, _profileValue];
                };
            };
        };
    };

    if !([configFile >> "ACE_Settings" >> _name] call _parseConfigForDisplayNames) then {
        if !([configFile >> "ACE_ServerSettings" >> _name] call _parseConfigForDisplayNames) then {
            [missionConfigFile >> "ACE_Settings" >> _name] call _parseConfigForDisplayNames;
        };
    };

} forEach GVAR(settings);
