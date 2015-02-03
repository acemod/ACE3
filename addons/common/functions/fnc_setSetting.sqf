/*
 * Author: CAA-Picard
 * Change the value of an existing setting if it was not previously forced. Force if neccesary.
 * If executed on clients it has local effect.
 * If executed on server it can have global effect if the last parameter is set to true.
 *
 * Arguments:
 * 0: Setting name (String)
 * 1: Value (Any)
 * 2: Force it? (Bool) (Optional)
 * 3: Broadcast the change to all clients (Bool) (Optional)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_name","_value"];
_name = _this select 0;
_value = _this select 1;

private ["_force"];
_force = false;
if (count _this > 2) then {
    _force = _this select 2;
};

_settingData = [_name] call FUNC(getSettingData);

// Exit if the setting does not exist
if (count _settingData == 0) exitWith {};

// Exit if the setting is already forced
if (_settingData select 6) exitWith {};

// If the type is not equal, try to cast it
if ((typeName _value) != (_settingData select 1)) then {
    _failed = True;
    if ((_settingData select 1) == "BOOL" and (typeName _value) == "SCALAR") exitWith {
        _value = _value > 0;
        _failed = false;
    };
    if ((_settingData select 1) == "COLOR" and (typeName _value) == "ARRAY") exitWith {
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

if (isServer && {count _this > 3} && {_this select 3}) then {
    // Publicize the new value
    publicVariable _name;

    // Raise event globally, this publicizes eventual changes in _force status so clients can update it locally
    ["SettingChanged", [_name, _value, _force]] call FUNC(globalEvent);
} else {
    // Raise event locally
    ["SettingChanged", [_name, _value, _force]] call FUNC(localEvent);
};
