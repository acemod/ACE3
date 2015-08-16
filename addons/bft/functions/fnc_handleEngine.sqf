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

params ["_object", "_turnedOn"];

// clear out any device in available devices that is owned by the object.
// We do this for both engine on and engine off to avoid any duplicates
private ["_device","_i"];


for "_i" from (count GVAR(availableDevices) - 1) to 0 step -1 do {
    _device = GVAR(availableDevices) select _i;
    if (AD_GET_DEVICE_STATE_VALUE(_device) isEqualTo STATE_NORMAL) then {
        if (AD_GET_OWNER(_device) == _object) then {
            GVAR(availableDevices) deleteAt _i;
            _i = _i - 1;
        };
    };
};

if (_turnedOn) then {
    private ["_deviceData", "_encryptionKeys", "_deviceModes", "_displayData"];
    {
        _deviceData = [_x] call FUNC(getDeviceData);

        if !(isNull D_GET_OWNER(_deviceData)) then {
            if !(D_GET_DEVICE_STATE_VALUE(_deviceData) isEqualTo STATE_NORMAL) exitwith {}; // means we didn't remove it
            _encryptionKeys = D_GET_ENCRYPTION(_deviceData);
            if !([_encryptionKeys, GVAR(registeredEncyptionKeys)] call FUNC(encryptionKeyMatch)) exitWith {};

            _deviceModes = D_GET_DEVICEMODES(_deviceData);
            if !([_deviceModes, GVAR(registeredViewModes)] call FUNC(encryptionKeyMatch)) exitWith {};

            _displayData = _deviceData call FUNC(deviceDataToMapData);
            if (count _displayData > 0) then {
                GVAR(availableDevices) pushback _displayData;
            };
        };
    }foreach (_object getvariable [QGVAR(ownedDevices), []]);
};
