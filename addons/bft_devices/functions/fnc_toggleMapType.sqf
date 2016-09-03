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

params ["_interfaceID"];

private _mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
_mapTypes params ["_mapTypesIndexes"];

private _currentMapType = [_interfaceID,"mapType"] call FUNC(getSettings);
private _currentMapTypeIndex = _mapTypesIndexes find _currentMapType;
if (_currentMapTypeIndex == count _mapTypesIndexes - 1) then {
    [_interfaceID,[["mapType", _mapTypesIndexes select 0]]] call FUNC(setSettings);
} else {
    [_interfaceID,[["mapType", _mapTypesIndexes select (_currentMapTypeIndex + 1)]]] call FUNC(setSettings);
};

true
