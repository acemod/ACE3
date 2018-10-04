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


params ["_object", "_turnedOn"];

// clear out any device in available devices that is owned by the object.
// We do this for both engine on and engine off to avoid any duplicates
for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
    private _device = GVAR(availableDevices) select _i;
    if (AD_GET_DEVICE_STATE_VALUE(_device) isEqualTo STATE_NORMAL) then {
        if (AD_GET_OWNER(_device) == _object) then {
            GVAR(availableDevices) deleteAt _i;
            _i = _i - 1;
        };
    };
};

if (_turnedOn) then {
    {
        private _deviceData = [_x] call FUNC(getDeviceData);
        if (!(_deviceData isEqualTo [])) then {
            if !(isNull D_GET_OWNER(_deviceData)) then {
                if (D_GET_DEVICE_STATE_VALUE(_deviceData) isEqualTo STATE_OFFLINE) then {
                    private _deviceState = D_GET_DEVICE_STATE(_deviceData);
                    _deviceState set [0, STATE_NORMAL];
                };

                if !(D_GET_DEVICE_STATE_VALUE(_deviceData) isEqualTo STATE_NORMAL) exitwith {}; // means we didn't remove it
                private _encryptionKeys = D_GET_ENCRYPTION(_deviceData);
                if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitWith {};

                private _deviceModes = D_GET_DEVICEMODES(_deviceData);
                if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};

                private _displayData = _deviceData call FUNC(deviceDataToMapData);
                if (count _displayData > 0) then {
                    GVAR(availableDevices) pushback _displayData;
                };
            };
        };
    } foreach (_object getvariable [QGVAR(ownedDevices), []]);
} else {
    if (!alive _object) exitwith {};

    {
        private _deviceData = [_x] call FUNC(getDeviceData);
        if (!(_deviceData isEqualTo [])) then {
            if !(isNull D_GET_OWNER(_deviceData)) then {
                if (D_GET_DEVICE_STATE_VALUE(_deviceData) isEqualTo STATE_NORMAL) then {
                    private _deviceState = D_GET_DEVICE_STATE(_deviceData);
                    _deviceState set [0, STATE_OFFLINE];
                };
            };
        };
    }foreach (_object getvariable [QGVAR(ownedDevices), []]);
};
