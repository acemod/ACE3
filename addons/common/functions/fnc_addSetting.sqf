/*
 * Author: esteldunedain
 * Adds a new setting at runtime, with all it's metadata.
 * If has only local effects.
 *
 * Arguments:
 * 0: _name (String)
 * 1: _typeName (String)
 * 2: _isClientSetable (Bool)
 * 3: _localizedName (String)
 * 4: _localizedDescription (String)
 * 5: _possibleValues (Array)
 * 6: _isForced (Bool)
 * 7: defaultValue (Any)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_8_PVT(_this,_name,_typeName,_isClientSetable,_localizedName,_localizedDescription,_possibleValues,_isForced,_value);

private["_settingData"];

_settingData = [_name] call FUNC(getSettingData);

// Exit if the setting already exists
if (count _settingData > 0) exitWith {};

// Update the variable
TRACE_2("Setting added",_name,_value);

// Init the variable
missionNamespace setVariable [_name, _value];

// Add the setting data
GVAR(settings) pushBack _this;

// Raise event locally
["SettingChanged", [_name, _value]] call FUNC(localEvent);
