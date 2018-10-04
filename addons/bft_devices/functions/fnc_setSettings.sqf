/*
 * Author: Gundy
 *
 * Description:
 *   Write interface settings. Will call ace_bft_devices_ifUpdate for any setting that have changed.
 *
 * Arguments:
 *   0: Interface ID <STRING>
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
 *   ["interfaceID",[["mapType","SAT"],["mapScaleDsp","4"]]] call ace_bft_devices_fnc_setSettings;
 *
 *   // Update mapWorldPos and update the interface even if the value has not changed
 *   ["interfaceID",[["mapWorldPos",getPosASL vehicle player]],true,true] call ace_bft_devices_fnc_setSettings;
 *
 *   // Update mapWorldPos and mapScale, but do not update the interface
 *   ["interfaceID",[["mapWorldPos",getPosASL vehicle player],["mapScaleDsp","2"]],false] call ace_bft_devices_fnc_setSettings;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_interfaceID", "_properties", ["_updateInterface", true], ["_forceInterfaceUpdate", false] ];

private _commonProperties = [GVAR(settings), "COMMON"] call CBA_fnc_hashGet;
private _deviceAppData = [GVAR(settings), _interfaceID] call CBA_fnc_hashGet;

// Write multiple property pairs. If they exist in _deviceAppData, write them there, else write them to COMMON. Only write if they exist and have changed.
private _commonPropertiesUpdate = [] call CBA_fnc_hashCreate;
private _combinedPropertiesUpdate = [] call CBA_fnc_hashCreate;
{
    private _key = _x select 0;
    private _value = _x select 1;
    call {
        private _currentValue = [_deviceAppData, _key] call CBA_fnc_hashGet;
        if (!isNil "_currentValue") exitWith {
            call {
                if !(_currentValue isEqualTo _value) exitWith {
                    [_combinedPropertiesUpdate,_key,_value] call CBA_fnc_hashSet;
                    [_deviceAppData, _key, _value] call CBA_fnc_hashSet;
                };
                if (_forceInterfaceUpdate) then {
                    [_combinedPropertiesUpdate, _key, _value] call CBA_fnc_hashSet;
                };
            };
        };
        _currentValue = [_commonProperties, _key] call CBA_fnc_hashGet;
        if (!isNil "_currentValue") then {
            call {
                if !(_currentValue isEqualTo _value) then {
                    [_commonPropertiesUpdate, _key, _value] call CBA_fnc_hashSet;
                    [_commonProperties, _key, _value] call CBA_fnc_hashSet;
                };
                if (_forceInterfaceUpdate) then {
                    [_commonPropertiesUpdate, _key, _value] call CBA_fnc_hashSet;
                };
            };
        };
    };
} forEach _properties;
[GVAR(settings), _interfaceID, _deviceAppData] call CBA_fnc_hashSet;
[GVAR(settings), "COMMON", _commonProperties] call CBA_fnc_hashSet;

// Finally, call an interface update for the updated properties, but only if the currently interface uses the same property group, if not, pass changed common properties only.
if (!I_CLOSED) then {
    call {
        if (!_updateInterface) exitWith {};
        if !(_combinedPropertiesUpdate isEqualTo []) exitWith {
            [_combinedPropertiesUpdate] call FUNC(ifUpdate);
        };
        if !(_commonPropertiesUpdate isEqualTo []) then {
            [_commonPropertiesUpdate] call FUNC(ifUpdate);
        };
    };
};

if (_combinedPropertiesUpdate isEqualTo ([] call CBA_fnc_hashCreate) && {_combinedPropertiesUpdate isEqualTo ([] call CBA_fnc_hashCreate)}) exitWith {false};

true
