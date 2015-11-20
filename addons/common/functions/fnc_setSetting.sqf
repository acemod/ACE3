/*
 * Author: esteldunedain
 * Change the value of an existing setting if it was not previously forced. Force if neccesary.
 * If executed on clients it has local effect.
 * If executed on server it can have global effect if the last parameter is set to true.
 *
 * Arguments:
 * 0: Setting name <STRING>
 * 1: Value <ANY>
 * 2: Force it? (default: false) <BOOL>
 * 3: Broadcast the change to all clients (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_name", "_value", ["_force", false], ["_broadcastChanges", false]];

private ["_settingData", "_failed"];

_settingData = [_name] call FUNC(getSettingData);

// Exit if the setting does not exist
if (count _settingData == 0) exitWith {};

// Exit if the setting is already forced
if (_settingData select 6) exitWith {};

// If the type is not equal, try to cast it
_failed = false;
if (typeName _value != _settingData select 1) then {
    _failed = true;
    if (_settingData select 1 == "BOOL" && _value isEqualType 0) then {
        // If value is not 0 or 1 consider it invalid and don't set anything
        if (_value isEqualTo 0) then {
            _value = false;
            _failed = false;
        };
        if (_value isEqualTo 1) then {
            _value = true;
            _failed = false;
        };
    };
    if (_settingData select 1 == "COLOR" && _value isEqualType []) then {
        _failed = false;
    };
};

if (_failed) exitWith {};

// Force it if it was required
_settingData set [6, _force];

// Exit if the value didn't change
if (_value isEqualTo (missionNamespace getVariable _name)) exitWith {};

// Update the variable
TRACE_2("Variable Updated",_name,_value);
missionNamespace setVariable [_name, _value];

if (isServer && {_broadcastChanges}) then {
    // Publicize the new value
    publicVariable _name;

    // Raise event globally, this publicizes eventual changes in _force status so clients can update it locally
    ["SettingChanged", [_name, _value, _force]] call FUNC(globalEvent);
} else {
    // Raise event locally
    ["SettingChanged", [_name, _value, _force]] call FUNC(localEvent);
};
