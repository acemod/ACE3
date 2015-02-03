/*
 * Author: CAA-Picard
 * Load a setting from config if it was not previosuly forced. Force if neccesary.
 *
 * Arguments:
 * 0: Config entry (config entry)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_optionEntry);

_fnc_getValueWithType = {
    EXPLODE_2_PVT(_this,_optionEntry,_typeName);

    _value = getNumber (_optionEntry >> "value");
    diag_log text format ["%1 %2: %3", configName _optionEntry, _typeName, _value];
    if (_typeName == "BOOL") exitWith {
        _value > 0
    };
    if (_typeName == "STRING") exitWith {
        getText (_optionEntry >> "value")
    };
    if (_typeName == "ARRAY") exitWith {
        getArray (_optionEntry >> "value")
    };
    _value
};

_name = configName _optionEntry;

// Check if the variable is already defined
if (isNil _name) then {
    // That setting was not loaded yet

    // Get type from config
    _typeName = getText (_optionEntry >> "typeName");

    // Read entry and cast it to the correct type
    _value = [_optionEntry, _typeName] call _fnc_getValueWithType;

    // Init the variable and publish it
    missionNamespace setVariable [_name, _value];
    publicVariable _name;
    // Set the variable to not forced
    missionNamespace setVariable [format ["%1_forced", _name], false];
    publicVariable format ["%1_forced", _name];

    // Add the variable to a list on the server
    GVAR(settingsList) pushBack _name;

} else {
    // The setting already exists.

    // Check if it's already forced and quit
    if (missionNamespace getVariable format ["%1_forced", _name]) exitWith {};

    // The setting is not forced, so update the value

    // Get the type from the existing variable
    _typeName = typeName (missionNamespace getVariable _name);

    // Read entry and cast it to the correct type
    _value = [_optionEntry, _typeName] call _fnc_getValueWithType;

    // Update the variable and publish it
    missionNamespace setVariable [_name, _value];
    publicVariable _name;

    // Check if it needs forcing
    if (getNumber (_optionEntry >> "force") > 0) then {
        missionNamespace setVariable [format ["%1_forced", _name], true];
        publicVariable format ["%1_forced", _name];
    };
};
