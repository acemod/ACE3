/*
 * Author: Gundy
 *
 * Description:
 *   Toggle drawing of map tools
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   Draw map tools <BOOL>
 *
 * Example:
 *   _drawMapTools = ["deviceID"] call ace_bft_devices_toggleMapTools;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID","_newMapTools"];

_deviceID = _this select 0;
_newMapTools = !([_deviceID,"mapTools"] call FUNC(getSettings));
[_deviceID,[["mapTools",_newMapTools]]] call FUNC(setSettings);

_newMapTools