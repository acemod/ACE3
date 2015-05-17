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

private ["_deviceID","_deviceData"];
_deviceID = _this select 0;
_deviceData = _this select 1;

_data = [_deviceID] call FUNC(getDeviceData);

if (count _data == 0) exitwith {};
if (_deviceData isEqualTo (_data select 3)) exitwith {};

["bft_updateDeviceData", [_deviceID, _deviceData]] call EFUNC(common,globalEvent);
