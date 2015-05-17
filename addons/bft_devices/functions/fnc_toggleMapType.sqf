/*
 * Author: Gundy
 *
 * Description:
 *   Toggle mapType to the next one in the list of available map types
 *
 * Arguments:
 *   0: Name of uiNamespace variable for interface <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_fnc_toggleMapType;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_mapTypes","_currentMapType","_currentMapTypeIndex"];

_displayName = _this select 0;
_mapTypes = [_displayName,"mapTypes"] call FUNC(getSettings);
_currentMapType = [_displayName,"mapType"] call FUNC(getSettings);
_currentMapTypeIndex = (_mapTypes select 0) find _currentMapType;
if (_currentMapTypeIndex == count (_mapTypes select 0) - 1) then {
    [_displayName,[["mapType",_mapTypes select 0 select 0]]] call FUNC(setSettings);
} else {
    [_displayName,[["mapType",(_mapTypes select 0) select (_currentMapTypeIndex + 1)]]] call FUNC(setSettings);
};

true