/*
 * Author: Gundy
 *
 * Description:
 *   Toggle night mode
 *
 * Arguments:
 *   0: Device ID <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["deviceID"] call ace_bft_devices_fnc_toggleNightMode;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID","_nightMode"];

_deviceID = _this select 0;
_nightMode = [_deviceID,"nightMode"] call FUNC(getSettings);

if (_nightMode != 2) then {
    if (_nightMode == 0) then {_nightMode = 1} else {_nightMode = 0};
    [_deviceID,[["nightMode",_nightMode]]] call FUNC(setSettings);
};

true