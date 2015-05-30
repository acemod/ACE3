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

#include "script_component.hpp"

PARAMS_1(_deviceID);

private ["_data"];
_data = [];
{
    if (_x select 0 == _deviceID) exitWith {
        _data = _x; // GVAR(deviceData) select _foreachIndex;
    };
} forEach GVAR(deviceData);

_data
