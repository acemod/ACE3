/*
 * Author: Glowbal
 *
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID","_refreshRateRX","_deviceData"];

// by default, consider the device not having a receiver
_refreshRateRX = -1;
_deviceID = _this select 0;
_deviceData = [_deviceID] call FUNC(getDeviceData);
GVAR(currentOpenedDevice) = _deviceData;
if !(_deviceData isEqualTo []) then {
    _refreshRateRX = D_GET_REFRESH_RATE_RX(_deviceData);
    [D_GET_ENCRYPTION(_deviceData)] call FUNC(updateRegisteredEncryptionKeys);
};

[true,_refreshRateRX] call FUNC(updateAvailableDevicesPosition);
