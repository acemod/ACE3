#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 *   Read interface settings.
 *
 * Arguments:
 *   0: Interface ID <STRING>
 *
 *   (Optional)
 *   1: Name of individual property to read <STRING>
 *
 * Return Value:
 *   (If only parameter 0 is specified)
 *      The whole property hash for that display / dialog is returned, like so: [["propertyName1","propertyName2"],[propertyValue1,propertyValue2]] <ARRAY>
 *   (If parameter 1 is specified)
 *      Value of individual property, nil if it does not exist <ANY>
 *
 * Example:
 *   // Return all settings for TAD
 *   ["interfaceID"] call ace_bft_devices_fnc_getSettings;
 *
 *   // Return available map types for TAD
 *   ["interfaceID","mapTypes"] call ace_bft_devices_fnc_getSettings;
 *
 * Public: No
 */


private ["_property"];

params ["_interfaceID", ["_property", ""]];

// Fetch common and device specific property hashes
private _commonProperties = [GVAR(settings), "COMMON"] call CBA_fnc_hashGet;
private _deviceAppData = [GVAR(settings), _interfaceID] call CBA_fnc_hashGet;

// Return value of requested property
if (_property != "") exitWith {
    private _value = [_deviceAppData, _property] call CBA_fnc_hashGet;
    if (isNil "_value") then {
        _value = [_commonProperties, _property] call CBA_fnc_hashGet;
    };
    if (isNil "_value") then {nil} else {_value}
};

// Return list of all property hashes
private _combinedProperties = +_commonProperties;
systemChat format ["Device app data %1", _deviceAppData];
{
    [_combinedProperties, _x, [_deviceAppData, _x] call CBA_fnc_hashGet] call CBA_fnc_hashSet;
} forEach ([_deviceAppData] call CBA_fnc_hashKeys);

_combinedProperties
