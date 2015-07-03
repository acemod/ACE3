/*
 * Author: Gundy
 *
 * Description:
 *   Toggle mapType to the next one in the list of available map types
 *
 * Arguments:
 *   0: Interface ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["interfaceID"] call ace_bft_devices_fnc_toggleMapType;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_mapTypes","_currentMapType","_currentMapTypeIndex"];

PARAMS_1(_interfaceID);

_mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
_currentMapType = [_interfaceID,"mapType"] call FUNC(getSettings);
_currentMapTypeIndex = (_mapTypes select 0) find _currentMapType;
if (_currentMapTypeIndex == count (_mapTypes select 0) - 1) then {
    [_interfaceID,[["mapType",_mapTypes select 0 select 0]]] call FUNC(setSettings);
} else {
    [_interfaceID,[["mapType",(_mapTypes select 0) select (_currentMapTypeIndex + 1)]]] call FUNC(setSettings);
};

true