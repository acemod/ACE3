/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceID", "_newOwner", "_data", "_previousOwner", "_currentDevices"];
_deviceID = _this select 0;
_newOwner = _this select 1;

systemChat format["handleUpdateDeviceOwner: %1", _this];
diag_log format["handleUpdateDeviceOwner: %1", _this];

_data = [_deviceID] call FUNC(getDeviceData);
_previousOwner = _data select 5;
_data set [5, _newOwner];

["bft_deviceDataChanged", [_data, isNull _previousOwner]] call EFUNC(common,localEvent);

systemChat format["handleUpdate - setting new owner from %1 to %2", _previousOwner, _newOwner];
diag_log format["handleUpdate - setting new owner from %1 to %2", _previousOwner, _newOwner];

_newData = [_deviceID] call FUNC(getDeviceData);
systemChat format["handleUpdate - validate new owner - %1", (_newData select 5) == _newOwner];
diag_log format["handleUpdate - validate new owner - %1", (_newData select 5) == _newOwner];

if (!isNull _newOwner && {local _newOwner}) then {
    _currentDevices = _newOwner getvariable [QGVAR(ownedDevices), []];
    if !(_deviceID in _currentDevices) then {
        _currentDevices pushback _deviceID;
        _newOwner setvariable [QGVAR(ownedDevices), _currentDevices, true];

        systemChat format["handleUpdate - new ownedDevices: %1 %2", _newOwner, _currentDevices];
        diag_log format["handleUpdate - new ownedDevices: %1 %2", _newOwner, _currentDevices];

    };
};
if (!isNull _previousOwner && {local _previousOwner}) then {
    _currentDevices = _previousOwner getvariable [QGVAR(ownedDevices), []];
    if (_deviceID in _currentDevices) then {
        _currentDevices = _currentDevices - [_deviceID];
        _previousOwner setvariable [QGVAR(ownedDevices), _currentDevices, true];

        systemChat format["handleUpdate - new ownedDevices: %1 %2", _previousOwner, _currentDevices];
        diag_log format["handleUpdate - new ownedDevices: %1 %2", _previousOwner, _currentDevices];
    };
};
systemChat format["handleUpdate - devices: %1", GVAR(deviceData)];
diag_log format["handleUpdate - devices: %1", GVAR(deviceData)];
