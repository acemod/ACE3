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

private _mapTypesHash = [_interfaceID, "mapTypes"] call FUNC(getSettings);

private _mapTypes = _mapTypesHash select 1;
private _mapTypesIndexes = _mapTypesHash select 2;
systemChat format ["mapTypes %1", _mapTypes];
systemChat format ["mapTypesIndexes %1", _mapTypesIndexes];

private _currentMapType = [_interfaceID, "mapType"] call FUNC(getSettings);
private _currentMapTypeIndex = _mapTypes find _currentMapType;

systemChat format ["currentMapType %1", _currentMapType];
systemChat format ["currentMapIndex %1", _currentMapTypeIndex];

if (_currentMapTypeIndex == (count _mapTypesIndexes) - 1) then {
    [_interfaceID, [["mapType", _mapTypes select 0]]] call FUNC(setSettings);
} else {
    [_interfaceID, [["mapType", _mapTypes select (_currentMapTypeIndex + 1)]]] call FUNC(setSettings);
};

true
