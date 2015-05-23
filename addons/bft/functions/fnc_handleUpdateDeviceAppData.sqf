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

private ["_deviceID", "_newData", "_data"];
_deviceID = _this select 0;
_newData = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);
_data set [3, _newData];

// ["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
