/*
 * Author: Gundy
 *
 * Description:
 *   Read interface settings.
 *
 * Arguments:
 *   0: Name of uiNamespace display / dialog variable <STRING>
 *   
 *   (Optional)
 *   1: Name of individual property to read <STRING>
 *
 * Return Value:
 *   (If only parameter 0 is specified)
 *      The whole property hash for that display / dialog is returned, like so: [["propertyName1","propertyName2"],[propertyValue1,propertyValue2]] <ARRAY>
 *      If the uiNamespace variable cannot be found in ace_bft_devices_displayPropertyGroups, nil is returned. <NIL>
 *   (If parameter 1 is specified)
 *      Value of individual property, nil if it does not exist <ANY>
 *
 * Example:
 *   // Return all settings for TAD
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_fnc_getSettings;
 *   
 *   // Return available map types for TAD
 *   ["ace_bft_devices_TAD_dlg","mapTypes"] call ace_bft_devices_fnc_getSettings;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_propertyGroupName","_commonProperties","_groupProperties","_combinedProperties","_property","_value"];

_propertyGroupName = HASH_GET(GVAR(displayPropertyGroups),_this select 0);

// Exit with nil if uiNamespace variable cannot be found in GVAR(displayPropertyGroups)
if (isNil "_propertyGroupName") exitWith {nil};

// Fetch common and interface group specific property hashes
_commonProperties = HASH_GET(GVAR(Settings),"COMMON");
_groupProperties = HASH_GET(GVAR(Settings),_propertyGroupName);
if (isNil "_groupProperties") then {_groupProperties = HASH_CREATE;};

// Return value of requested property
_property = _this select 1;
if (count _this == 2) exitWith {
    _value = HASH_GET(_groupProperties,_property);
    if (isNil "_value") then {
        _value = HASH_GET(_commonProperties,_property);
    };
    if (isNil "_value") then {nil} else {_value}
};

// Return list of all property hashes
_combinedProperties = +_commonProperties;
{
    HASH_SET(_combinedProperties,_x,(_groupProperties select 1) select _forEachIndex);
} forEach (_groupProperties select 0);

_combinedProperties