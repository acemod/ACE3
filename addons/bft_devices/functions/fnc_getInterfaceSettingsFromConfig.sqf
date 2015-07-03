/*
 * Author: Gundy
 *
 * Description:
 *   Read InterfaceSettings for interface from config
 *
 * Arguments:
 *   0: Interface config name <STRING>
 *
 * Return Value:
 *   HASH of InterfaceSettings config class <ARRAY>
 *
 * Example:
 *   ["JV5"] call ace_bft_fnc_getInterfaceSettingsFromConfig;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_interfaceConfigPath","_configHash"];

PARAMS_1(_interface);

_interfaceConfigPath = configFile >> "ACE_BFT" >> "Interfaces" >> _interface >> "InterfaceSettings";

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

[_interfaceConfigPath] call _configToHash;