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

params ["_data"];

private _deviceID = D_GET_ID(_data);
diag_log format["hanldeDeviceDataChanged for: %1", _deviceID];

if (isNull D_GET_OWNER(_data)) exitwith { // doesn't have an owner anymore, remove.
    diag_log format["hanldeDeviceDataChanged for: %1 - has no owner, removing", _deviceID];
    if !(_this select 1) then {
        // remove from availableDevices
        {
            if (AD_GET_ID(_x) == _deviceID) exitwith {
                GVAR(availableDevices) deleteAt _forEachIndex;
            };
        } foreach GVAR(availableDevices);
    };
};
private _encryptionKeys = D_GET_ENCRYPTION(_data);
private _deviceModes = D_GET_DEVICEMODES(_data);

if (_this select 1) then { // add new
    if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {
        diag_log format["hanldeDeviceDataChanged for: %1 - encryptionkeys not known - %2", _deviceID, _encryptionKeys];
    }; // if the encryption key is not know, the device is not available
    if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {
        diag_log format["hanldeDeviceDataChanged for: %1 - viewModes not known - %2", _deviceID, _deviceModes];
    }; // if the encryption key is not know, the device is not available
    if (!(D_GET_OWNER(_data) isKindOf "CAManBAse") && {D_GET_DEVICE_STATE_VALUE(_data) isEqualTo STATE_NORMAL} && {!(isEngineOn D_GET_OWNER(_data)) && alive D_GET_OWNER(_data)}) exitwith {};
    if (D_GET_DEVICE_STATE_VALUE(_data) in [STATE_OFFLINE, STATE_DESTROYED]) exitwith {};
    private _displayData = _data call FUNC(deviceDataToMapData);
    if !(_displayData isEqualTo []) then {
        GVAR(availableDevices) pushback _displayData;
    };
} else { // update existing
    {
        if (AD_GET_ID(_x) == _deviceID) exitwith { // device was already available
            if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {
                GVAR(availableDevices) deleteAt _forEachIndex; // no longer a match, so we remove it from available devices
            };
            if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {
                GVAR(availableDevices) deleteAt _forEachIndex; // no longer a match, so we remove it from available devices
            };
            if (D_GET_DEVICE_STATE_VALUE(_data) in [STATE_OFFLINE, STATE_DESTROYED]) exitwith {};
            // TODO I don't think we need this check here? It should never make it in and otherwise be removed if the engine goes off?
            //if (!(D_GET_OWNER(_data) isKindOf "CAManBAse") && {D_GET_DEVICE_STATE_VALUE(_data) isEqualTo STATE_NORMAL} && {!(isEngineOn D_GET_OWNER(_data))}) exitwith {
            //    GVAR(availableDevices) deleteAt _forEachIndex; // no longer a match, so we remove it from available devices
            //};
            // we don't know what info has changed, so we just replace it completely.
            private _displayData = _data call FUNC(deviceDataToMapData);
            GVAR(availableDevices) set [_forEachIndex, _displayData];
        };
    } foreach GVAR(availableDevices);
};
