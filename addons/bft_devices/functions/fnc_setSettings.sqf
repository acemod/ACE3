/*
 * Author: Gundy
 *
 * Description:
 *   Write interface settings. Will call ace_bft_devices_ifUpdate for any setting that have changed.
 *
 * Arguments:
 *   0: Name of uiNamespace display / dialog variable <STRING>
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
 *   ["ace_bft_devices_TAD_dlg",[["mapType","SAT"],["mapScaleDsp","4"]]] call ace_bft_devices_fnc_setSettings;
 *   
 *   // Update mapWorldPos and update the interface even if the value has not changed
 *   ["ace_bft_devices_TAD_dlg",[["mapWorldPos",getPosASL vehicle player]],true,true] call ace_bft_devices_fnc_setSettings;
 *   
 *   // Update mapWorldPos and mapScale, but do not update the interface
 *   ["ace_bft_devices_TAD_dlg",[["mapWorldPos",getPosASL vehicle player],["mapScaleDsp","2"]],false] call ace_bft_devices_fnc_setSettings;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_propertyGroupName","_commonProperties","_groupProperties","_properties","_commonPropertiesUpdate","_combinedPropertiesUpdate","_key","_value","_currentValue","_updateInterface","_forceInterfaceUpdate"];

_propertyGroupName = HASH_GET(GVAR(displayPropertyGroups),_this select 0);

// Exit with FALSE if uiNamespace variable cannot be found in GVAR(displayPropertyGroups)
if (isNil "_propertyGroupName") exitWith {false};

_commonProperties = HASH_GET(GVAR(Settings),"COMMON");
_groupProperties = HASH_GET(GVAR(Settings),_propertyGroupName);
if (isNil "_groupProperties") then {_groupProperties = HASH_CREATE;};

_properties = _this select 1;
_updateInterface = if (count _this > 2) then {_this select 2} else {true};
_forceInterfaceUpdate = if (count _this > 3) then {_this select 3} else {false};

// Write multiple property pairs. If they exist in _groupProperties, write them there, else write them to COMMON. Only write if they exist and have changed.
_commonPropertiesUpdate = HASH_CREATE;
_combinedPropertiesUpdate = HASH_CREATE;
{
    _key = _x select 0;
    _value = _x select 1;
    call {
        _currentValue = HASH_GET(_groupProperties,_key);
        if (!isNil "_currentValue") exitWith {
            call {
                if !(_currentValue isEqualTo _value) exitWith {
                    HASH_SET(_combinedPropertiesUpdate,_key,_value);
                    HASH_SET(_groupProperties,_key,_value);
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
HASH_SET(GVAR(Settings),_propertyGroupName,_groupProperties);
HASH_SET(GVAR(Settings),"COMMON",_commonProperties);

// Finally, call an interface update for the updated properties, but only if the currently interface uses the same property group, if not, pass changed common properties only.
if (!isNil QGVAR(ifOpen)) then {
    call {
        if (!_updateInterface) exitWith {};
        if ((HASH_GET(GVAR(displayPropertyGroups),GVAR(ifOpen) select 1) == _propertyGroupName) && {count _combinedPropertiesUpdate > 0}) exitWith {
            [_combinedPropertiesUpdate] call FUNC(ifUpdate);
        };
        if (count _commonPropertiesUpdate > 0) then {
            [_commonPropertiesUpdate] call FUNC(ifUpdate);
        };
    };
};

if (_combinedPropertiesUpdate isEqualTo HASH_CREATE && _combinedPropertiesUpdate isEqualTo HASH_CREATE) exitWith {false};

true