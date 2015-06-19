/*
 * Author: Gundy
 *
 * Description:
 *   Write interface settings. Will call ace_bft_devices_ifUpdate for any setting that have changed.
 *
 * Arguments:
 *   0: Device ID <STRING>
 *   1: Property pair(s) to write in the form of [["propertyName",propertyValue],[...]] <ARRAY>
 *   
 *   (Optional)
 *   2: If set to false, do not update interface (default true) <BOOLEAN>
 *   3: If set to true, update interface even if the values haven't changed (default false) <BOOLEAN>
 *
 * Return Value:
 *   If settings could be stored <BOOL>
 *
 * Example:
 *   ["deviceID",[["mapType","SAT"],["mapScaleDsp","4"]]] call ace_bft_devices_fnc_setSettings;
 *   
 *   // Update mapWorldPos and update the interface even if the value has not changed
 *   ["deviceID",[["mapWorldPos",getPosASL vehicle player]],true,true] call ace_bft_devices_fnc_setSettings;
 *   
 *   // Update mapWorldPos and mapScale, but do not update the interface
 *   ["deviceID",[["mapWorldPos",getPosASL vehicle player],["mapScaleDsp","2"]],false] call ace_bft_devices_fnc_setSettings;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_commonProperties","_deviceAppData","_properties","_commonPropertiesUpdate","_combinedPropertiesUpdate","_key","_value","_currentValue","_updateInterface","_forceInterfaceUpdate","_deviceID"];

_deviceID = _this select 0;

_commonProperties = HASH_GET(GVAR(settings),"COMMON");
_deviceAppData = HASH_GET(GVAR(settings),_deviceID);

// if no device appData could be retrieved from cache
if (isNil "_deviceAppData") then {
    // read from config
    _deviceAppData = [_deviceID] call FUNC(getDeviceAppData);
};

_properties = _this select 1;
_updateInterface = if (count _this > 2) then {_this select 2} else {true};
_forceInterfaceUpdate = if (count _this > 3) then {_this select 3} else {false};

// Write multiple property pairs. If they exist in _deviceAppData, write them there, else write them to COMMON. Only write if they exist and have changed.
_commonPropertiesUpdate = HASH_CREATE;
_combinedPropertiesUpdate = HASH_CREATE;
{
    _key = _x select 0;
    _value = _x select 1;
    call {
        _currentValue = HASH_GET(_deviceAppData,_key);
        if (!isNil "_currentValue") exitWith {
            call {
                if !(_currentValue isEqualTo _value) exitWith {
                    HASH_SET(_combinedPropertiesUpdate,_key,_value);
                    HASH_SET(_deviceAppData,_key,_value);
                };
                if (_forceInterfaceUpdate) then {
                    HASH_SET(_combinedPropertiesUpdate,_key,_value);
                };
            };
        };
        _currentValue = HASH_GET(_commonProperties,_key);
        if (!isNil "_currentValue") then {
            call {
                if !(_currentValue isEqualTo _value) then {
                    HASH_SET(_commonPropertiesUpdate,_key,_value);
                    HASH_SET(_commonProperties,_key,_value);
                };
                if (_forceInterfaceUpdate) then {
                    HASH_SET(_commonPropertiesUpdate,_key,_value);
                };
            };
        };
    };
} forEach _properties;
HASH_SET(GVAR(settings),_deviceID,_deviceAppData);
HASH_SET(GVAR(settings),"COMMON",_commonProperties);

// Finally, call an interface update for the updated properties, but only if the currently interface uses the same property group, if not, pass changed common properties only.
if (!I_CLOSED) then {
    call {
        if (!_updateInterface) exitWith {};
        if (count _combinedPropertiesUpdate > 0) exitWith {
            [_combinedPropertiesUpdate] call FUNC(ifUpdate);
        };
        if (count _commonPropertiesUpdate > 0) then {
            [_commonPropertiesUpdate] call FUNC(ifUpdate);
        };
    };
};

if (_combinedPropertiesUpdate isEqualTo HASH_CREATE && _combinedPropertiesUpdate isEqualTo HASH_CREATE) exitWith {false};

true