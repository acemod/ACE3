/*
 * Author: esteldunedain
 * Returns the metadata of a setting if it exists
 *
 * Arguments:
 * 0: Name of the setting (String)
 *
 * Return Value:
 * Setting Data (Array)
 * 0: _name
 * 1: _typeName
 * 2: _isClientSetable
 * 3: _localizedName
 * 4: _localizedDescription
 * 5: _possibleValues
 * 6: _isForced
 * 7: _defaultValue
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name"];

private ["_value"];
_value = [];
{
    if ((_x select 0) == _name) exitWith {_value = _x};
} forEach GVAR(settings);

_value
