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

private ["_deviceID", "_keys", "_data", "_encryption"];
_deviceID = _this select 0;
_keys = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);
_encryption = _data select 1;
_encryption set [1, _keys];

["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
