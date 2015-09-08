/*
 * Author: esteldunedain
 * Adds a new setting at runtime, with all it's metadata.
 * If has only local effects.
 *
 * Arguments:
 * 0: name <STRING>
 * 1: typeName <STRING>
 * 2: isClientSetable <BOOL>
 * 3: localizedName <STRING>
 * 4: localizedDescription <STRING>
 * 5: possibleValues <ARRAY>
 * 6: isForced <BOOL>
 * 7: defaultValue <ANY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_settingData"];

params ["_name", "", "", "", "", "", "", "_value"];


_settingData = [_name] call FUNC(getSettingData);

// Exit if the setting already exists
if (_settingData isEqualTo []) exitWith {};

// Update the variable
TRACE_2("Setting added",_name,_value);

// Init the variable
missionNamespace setVariable [_name, _value];

// Add the setting data
GVAR(settings) pushBack _this;

// Raise event locally
["SettingChanged", [_name, _value]] call FUNC(localEvent);
