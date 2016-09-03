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

#include "script_component.hpp"

private ["_property"];

params ["_interfaceID", ["_property", ""]];

// Fetch common and device specific property hashes
private _commonProperties = HASH_GET(GVAR(settings),"COMMON");
private _deviceAppData = HASH_GET(GVAR(settings),_interfaceID);

// Return value of requested property
if (_property != "") exitWith {
    private _value = HASH_GET(_deviceAppData,_property);
    if (isNil "_value") then {
        _value = HASH_GET(_commonProperties,_property);
    };
    if (isNil "_value") then {nil} else {_value}
};

// Return list of all property hashes
private _combinedProperties = +_commonProperties;
{
    HASH_SET(_combinedProperties,_x,(_deviceAppData select 1) select _forEachIndex);
} forEach (_deviceAppData select 0);

_combinedProperties
