/*
 * Author: CAA-Picard
 * Load a setting from config if it was not previosuly forced. Force if neccesary.
 *
 * Arguments:
 * 0: Setting name (String)
 * 1: Config entry (config entry)
  *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_name,_optionEntry);

_fnc_getValueWithType = {
    EXPLODE_2_PVT(_this,_optionEntry,_typeName);

    _value = getNumber (_optionEntry >> "value");
    if (_typeName == "BOOL") exitWith {
        _value = _value > 0;
    };
    if (_typeName == "STRING") exitWith {
        _value = getText (_optionEntry >> "value");
    };
    if (_typeName == "ARRAY") exitWith {
        _value = getArray (_optionEntry >> "value");
    };
    _value
};

// Check if the variable is already defined
if (isNil _name) exitWith {
    // That setting was not loaded yet

    //diag_log text format ["[ACE]: Mission setting '%1' doesn't exist", _name];

    _typeEntry = _this select 2;
    _typeName = getText _typeEntry;

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
    _typeName = typeName missionNamespace getVariable _name;
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
