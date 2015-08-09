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

private ["_data"];
params ["_deviceId"];

_data = [_deviceId] call FUNC(getDeviceData);

D_GET_DEVICE_STATE(_data) set [0, STATE_DESTROYED];
D_GET_DEVICE_STATE(_data) set [1, getPosASL vehicle D_GET_OWNER(_data)];
D_GET_DEVICE_STATE(_data) set [2, direction vehicle D_GET_OWNER(_data)];
D_GET_DEVICE_STATE(_data) set [3, ACE_time];


if !(isNull D_GET_OWNER(_data)) then {
    _encryptionKeys = D_GET_ENCRYPTION(_data);
    if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitWith {};

    _deviceModes = D_GET_DEVICEMODES(_data);
    if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};

    _displayData = _data call FUNC(deviceDataToMapData);
    {
        if (AD_GET_ID(_x) == _deviceId) exitwith {
             GVAR(availableDevices) set[_foreachIndex, _displayData];
        };
    }foreach GVAR(availableDevices);
};
