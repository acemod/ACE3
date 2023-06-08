#include "script_component.hpp"
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


params ["_interface"];

private _interfaceConfigPath = configFile >> "ACE_BFT" >> "Interfaces" >> _interface >> "InterfaceSettings";

private _configToHash = {
    params ["_config"];

    private _configProperties = configProperties [_config];
    private _configHash = [] call CBA_fnc_hashCreate;
    {
        private _key = configName _x;

        private _value = call {
            if (isClass _x) exitWith {
                [_x] call _configToHash
            };
            if (isNumber _x) exitWith {getNumber _x};
            if (isText _x) exitWith {
                private _tempValue = getText _x;
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
            [_configHash, _key, _value] call CBA_fnc_hashSet;
        };
    } forEach _configProperties;

    _configHash
};

[_interfaceConfigPath] call _configToHash;
