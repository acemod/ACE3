#include "script_component.hpp"
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


// by default, consider the device not having a receiver
private _refreshRateRX = -1;
private _deviceID = _this select 0;
private _deviceData = [_deviceID] call FUNC(getDeviceData);
GVAR(currentOpenedDevice) = _deviceData;
if !(_deviceData isEqualTo []) then {
    _refreshRateRX = D_GET_REFRESH_RATE_RX(_deviceData);
    [D_GET_ENCRYPTION(_deviceData)] call FUNC(updateRegisteredEncryptionKeys);
};

[true,_refreshRateRX] call FUNC(updateAvailableDevicesPosition);
