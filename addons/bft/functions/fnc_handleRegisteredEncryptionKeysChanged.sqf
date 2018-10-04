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


params ["_newEncryptionKeys", "_add"];

// if _add is nil, rebuild list from scratch
if (isNil "_add") then {
    // clear current list
    GVAR(availableDevices) = [];
    _add = true;
};

// exit if there is nothing to add / remove
if (count _newEncryptionKeys == 0) exitWith {};

if (_add) then {
    // Adding a new key isn't nice. Now we got to add new shit and loop through the massive data collection. yay?
    {
        if !(isNull D_GET_OWNER(_x)) then {
            if (!(D_GET_OWNER(_x) isKindOf "CAManBAse") && {D_GET_DEVICE_STATE_VALUE(_x) isEqualTo STATE_NORMAL} && {!(isEngineOn D_GET_OWNER(_x)) && alive D_GET_OWNER(_x)}) exitwith {};
            if (D_GET_DEVICE_STATE_VALUE(_x) in [STATE_OFFLINE, STATE_DESTROYED]) exitwith {};
            private _encryptionKeys = D_GET_ENCRYPTION(_x);
            if !([_encryptionKeys, _newEncryptionKeys] call FUNC(encryptionKeyMatch)) exitWith {};

            private _deviceModes = D_GET_DEVICEMODES(_x);
            if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};

            private _displayData = _x call FUNC(deviceDataToMapData);
            if (count _displayData > 0) then {
                GVAR(availableDevices) pushback _displayData;
            };
        };
    } foreach GVAR(deviceData);
} else { // if we remove one, we only have to check the already available devices
    for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
        private _device = GVAR(availableDevices) select _i;
        if !([AD_GET_ENCRYPTION(_device), GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) then {
            GVAR(availableDevices) deleteAt _i;
            _i = _i - 1;
        };
    };
};
if (count GVAR(currentOpenedDevice) > 0) then {
    [GVAR(currentOpenedDevice)] call FUNC(removeDeviceByOwner);
};
