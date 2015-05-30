/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: device data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_2(_deviceID,_deviceData);

private ["_data"];
_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if (_deviceData isEqualTo (_data select 3)) exitwith {};

["bft_updateDeviceData", [_deviceID, _deviceData]] call EFUNC(common,globalEvent);
