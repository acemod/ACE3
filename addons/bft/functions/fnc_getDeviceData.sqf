/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID", "_data"];
_deviceID = _this select 0;
_data = [];
{
    if (_x select 0 == _deviceID) exitwith {
        _data = _x; // GVAR(deviceData) select _foreachIndex;
    };
}foreach GVAR(deviceData);

_data;
