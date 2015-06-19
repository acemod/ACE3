/*
 * Author: Gundy
 *
 * Description:
 *   Toggle mapType to the next one in the list of available map types
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["deviceID"] call ace_bft_devices_fnc_toggleMapType;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID","_mapTypes","_currentMapType","_currentMapTypeIndex"];

_deviceID = _this select 0;
_mapTypes = [_deviceID,"mapTypes"] call FUNC(getSettings);
_currentMapType = [_deviceID,"mapType"] call FUNC(getSettings);
_currentMapTypeIndex = (_mapTypes select 0) find _currentMapType;
if (_currentMapTypeIndex == count (_mapTypes select 0) - 1) then {
    [_deviceID,[["mapType",_mapTypes select 0 select 0]]] call FUNC(setSettings);
} else {
    [_deviceID,[["mapType",(_mapTypes select 0) select (_currentMapTypeIndex + 1)]]] call FUNC(setSettings);
};

true