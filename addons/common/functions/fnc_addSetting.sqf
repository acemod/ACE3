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
 * Example:
 * ["bob", "type", true, "bob", "person", [1,2,3], true, 5] call ace_common_fnc_addSettings
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "", "", "", "", "", "", "_value"]; //["_name", "_typeName", "_isClientSetable", "_localizedName", "_localizedDescription", "_possibleValues", "_isForced", "_value"];

private _settingData = [_name] call FUNC(getSettingData);

// Exit if the setting already exists
if (count _settingData > 0) exitWith {};

// Update the variable
TRACE_2("Setting added",_name,_value);

// Init the variable
missionNamespace setVariable [_name, _value];

// Add the setting data
GVAR(settings) pushBack _this;

// Raise event locally
["ace_settingChanged", [_name, _value]] call CBA_fnc_localEvent;
