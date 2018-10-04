#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: device ID <STRING>
 * 1: new owner <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_deviceID", "_newOwner"];

systemChat format["handleUpdateDeviceOwner: %1", _this];
diag_log format["handleUpdateDeviceOwner: %1", _this];

private _data = [_deviceID] call FUNC(getDeviceData);
private _previousOwner = _data select 5;
_data set [5, _newOwner];

["bft_deviceDataChanged", [_data, isNull _previousOwner]] call CBA_fnc_localEvent;

systemChat format["handleUpdateDeviceOwner - setting new owner from %1 to %2", _previousOwner, _newOwner];
diag_log format["handleUpdateDeviceOwner - setting new owner from %1 to %2", _previousOwner, _newOwner];

private _newData = [_deviceID] call FUNC(getDeviceData);
systemChat format["handleUpdateDeviceOwner - validate new owner - %1", (_newData select 5) == _newOwner];
diag_log format["handleUpdateDeviceOwner - validate new owner - %1", (_newData select 5) == _newOwner];

if (!isNull _newOwner && {local _newOwner}) then {
    private _currentDevices = _newOwner getvariable [QGVAR(ownedDevices), []];
    if !(_deviceID in _currentDevices) then {
        _currentDevices pushback _deviceID;
        _newOwner setvariable [QGVAR(ownedDevices), _currentDevices, true];

        systemChat format["handleUpdateDeviceOwner - new ownedDevices: %1 %2", _newOwner, _currentDevices];
        diag_log format["handleUpdateDeviceOwner - new ownedDevices: %1 %2", _newOwner, _currentDevices];

    };
};
if (!isNull _previousOwner && {local _previousOwner}) then {
    diag_log format["handleUpdateDeviceOwner - removing device (%1) from owner %2 ", _deviceId, _previousOwner];
    private _currentDevices = _previousOwner getvariable [QGVAR(ownedDevices), []];
    if (_deviceID in _currentDevices) then {
        _currentDevices = _currentDevices - [_deviceID];
        _previousOwner setvariable [QGVAR(ownedDevices), _currentDevices, true];

        systemChat format["handleUpdateDeviceOwner - new ownedDevices: %1 %2", _previousOwner, _currentDevices];
        diag_log format["handleUpdateDeviceOwner - new ownedDevices: %1 %2", _previousOwner, _currentDevices];
    } else {
        diag_log format["handleUpdateDeviceOwner - tried removing a deviceId that doesnt exist in our previous owner ids: %1 %2", _previousOwner, _currentDevices];
    };
} else {
    diag_log format["handleUpdateDeviceOwner - no previous owner to remove stuff from %1 %2", _previousOwner, _deviceId];
};

systemChat format["handleUpdateDeviceOwner - devices: %1", GVAR(deviceData)];
diag_log format["handleUpdateDeviceOwner - devices: %1", GVAR(deviceData)];
