#include "script_component.hpp"
/*
 * Author: Gundy, TheMagnetar
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


params ["_interfaceID"];

// List of available map types
private _mapTypesHash = [_interfaceID, "mapTypes"] call FUNC(getSettings);
private _mapTypes = [_mapTypesHash] call CBA_fnc_hashKeys;

// Current map type
private _currentMapType = [_interfaceID, "mapType"] call FUNC(getSettings);
private _currentMapTypeIndex = _mapTypes find _currentMapType;

if (_currentMapTypeIndex == (count _mapTypes) - 1) then {
    [_interfaceID, [["mapType", _mapTypes select 0]]] call FUNC(setSettings);
} else {
    [_interfaceID, [["mapType", _mapTypes select (_currentMapTypeIndex + 1)]]] call FUNC(setSettings);
};

true
