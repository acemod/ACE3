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


params ["_deviceId"];

private _data = [_deviceId] call FUNC(getDeviceData);

systemChat format["handleVehicleDeviceKilled: %1 ", _deviceId];
diag_log format["handleVehicleDeviceKilled: %1 DATA: %2", _deviceId, _data];

private _deviceState = D_GET_DEVICE_STATE(_data);
_deviceState set [0, STATE_DESTROYED];
_deviceState set [1, getPosASL vehicle D_GET_OWNER(_data)];
_deviceState set [2, direction vehicle D_GET_OWNER(_data)];
_deviceState set [3, CBA_missionTime];

if !(isNull D_GET_OWNER(_data)) then {

    systemChat format["handleVehicleDeviceKilled: %1 - owner is not null", _deviceId];
    diag_log format["handleVehicleDeviceKilled: %1  - owner is not null", _deviceId];

    private _encryptionKeys = D_GET_ENCRYPTION(_data);
    if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitWith {};

    private _deviceModes = D_GET_DEVICEMODES(_data);
    if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};

    private _displayData = _data call FUNC(deviceDataToMapData);
    {
        if (AD_GET_ID(_x) == _deviceId) exitwith {
            systemChat format["handleVehicleDeviceKilled: %1 - setting new displayData %2", _deviceId, _displayData];
            diag_log format["handleVehicleDeviceKilled: %1  - setting new displayData %2", _deviceId, _displayData];
             GVAR(availableDevices) set[_foreachIndex, _displayData];
        };
    }foreach GVAR(availableDevices);
} else {
    systemChat format["handleVehicleDeviceKilled: %1 - owner is null", _deviceId];
    diag_log format["handleVehicleDeviceKilled: %1  - owner is null", _deviceId];
};
