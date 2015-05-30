/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: keys <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_keys);

private ["_data", "_encryption"];
_data = [_deviceID] call FUNC(getDeviceData);
_encryption = _data select 1;
_encryption set [1, _keys];

["bft_deviceDataChanged", [_data, false]] call EFUNC(common,localEvent);
