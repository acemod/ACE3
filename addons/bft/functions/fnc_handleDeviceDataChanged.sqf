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

private ["_data", "_deviceID", "_displayData", "_encryptionKeys", "_deviceModes"];
_data = _this select 0;
_deviceID = D_GET_ID(_data);

if (isNull D_GET_OWNER(_data)) exitwith { // doesn't have an owner anymore, remove.
    if !(_this select 1) then {
        // remove from availableDevices
        {
            if (AD_GET_ID(_x) == _deviceID) exitwith {
                GVAR(availableDevices) deleteAt _forEachIndex;
            };
        } foreach GVAR(availableDevices);
    };
};
_encryptionKeys = D_GET_ENCRYPTION(_data);
_deviceModes = D_GET_DEVICEMODES(_data);

if (_this select 1) then { // add new
    if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitwith {}; // if the encryption key is not know, the device is not available
    if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitwith {}; // if the encryption key is not know, the device is not available

    _displayData = _data call FUNC(deviceDataToMapData);
    if (count _displayData > 0) then {
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
            // we don't know what info has changed, so we just replace it completely.
            _displayData = _data call FUNC(deviceDataToMapData);
            GVAR(availableDevices) set [_forEachIndex, _displayData];
        };
    } foreach GVAR(availableDevices);
};
