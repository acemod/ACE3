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

private ["_add","_newEncryptionKeys"];
_newEncryptionKeys = _this select 0;
_add = _this select 1;

// if _add is nil, rebuild list from scratch
if (isNil "_add") then {
    // clear current list
    GVAR(availableDevices) = [];
    _add = true;
};

// exit if there is nothing to add / remove
if (count _newEncryptionKeys == 0) exitWith {};

if (_add) then {
    private ["_deviceModes","_encryptionKeys","_displayData"];

    // Adding a new key isn't nice. Now we got to add new shit and loop through the massive data collection. yay?
    {
        if !(isNull D_GET_OWNER(_x)) then {
            if (!(D_GET_OWNER(_x) isKindOf "CAManBAse") && {D_GET_DEVICE_STATE_VALUE(_x) isEqualTo STATE_NORMAL} && {!(isEngineOn D_GET_OWNER(_x))}) exitwith {};

            _encryptionKeys = D_GET_ENCRYPTION(_x);
            if !([_encryptionKeys, _newEncryptionKeys] call FUNC(encryptionKeyMatch)) exitWith {};

            _deviceModes = D_GET_DEVICEMODES(_x);
            if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};

            _displayData = _x call FUNC(deviceDataToMapData);
            if (count _displayData > 0) then {
                GVAR(availableDevices) pushback _displayData;
            };
        };
    } foreach GVAR(deviceData);
} else { // if we remove one, we only have to check the already available devices
    private ["_device","_i"];

    for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
        _device = GVAR(availableDevices) select _i;
        if !([AD_GET_ENCRYPTION(_device), GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) then {
            GVAR(availableDevices) deleteAt _i;
            _i = _i - 1;
        };
    };
};
if (count GVAR(currentOpenedDevice) > 0) then {
    [GVAR(currentOpenedDevice)] call FUNC(removeDeviceByOwner);
};

