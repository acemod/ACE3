#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 *
 * Return Value:
 * device data <ARRAY>
 *
 * Public: No
 */


params ["_deviceID"];

private _data = [];
{
    if (_x select 0 == _deviceID) exitWith {
        _data = _x; // GVAR(deviceData) select _foreachIndex;
    };
} forEach GVAR(deviceData);

_data
