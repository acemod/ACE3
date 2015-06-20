/*
 * Author: Gundy
 *
 * Description:
 *   Read InterfaceSettings for device from config
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   HASH of InterfaceSettings config class <ARRAY>
 *
 * Example:
 *   ["deviceID"] call ace_bft_getDeviceAppData;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID","_deviceData","_deviceType","_deviceConfigPath","_configHash"];

_deviceID = _this select 0;
_deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
_deviceType = D_GET_DEVICETYPE(_deviceData);

_deviceConfigPath =  configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "InterfaceSettings";

_configToHash = {
    private ["_config","_configProperties","_configHash","_key","_value","_tempValue"];
    
    _config = _this select 0;
    
    _configProperties = configProperties [_config];
    _configHash = HASH_CREATE;
    {
        _key = configName _x;
        
        _value = call {
            if (isClass _x) exitWith {
                [_x] call _configToHash
            };
            if (isNumber _x) exitWith {getNumber _x};
            if (isText _x) exitWith {
                _tempValue = getText _x;
                call {
                    if (_tempValue == "true") exitWith {true};
                    if (_tempValue == "false") exitWith {false};
                    _tempValue
                };
            };
            if (isArray _x) exitWith {getArray _x};
            nil
        };
        if !(isNil "_value") then {
            HASH_SET(_configHash,_key,_value);
        };
    } forEach _configProperties;
    
    _configHash
};

[_deviceConfigPath] call _configToHash;