/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ?
 * 1: ?
 * 2: ?
 * 3: ?
 * 4: ?
 * 5: ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_currentDevices"];
// [_magID, [_deviceSide, _deviceEncryptionKeys], _assignableInformation, _app, -1, _owner]
GVAR(deviceData) pushback _this;

systemChat format["handleAddDeviceData: %1", _this];
diag_log format["handleAddDeviceData: %1", _this];

if (local (_this select 5)) then {
    _currentDevices = (_this select 5) getvariable [QGVAR(ownedDevices), []];
    if !((_this select 0) in _currentDevices) then {
        _currentDevices pushback (_this select 0);
        (_this select 5) setvariable [QGVAR(ownedDevices), _currentDevices, true];

        systemChat format["handleAdd - ownedDevices: %1 %2", (_this select 5), _currentDevices];
        diag_log format["handleAdd - ownedDevices: %1 %2", (_this select 5), _currentDevices];
    };
};

["bft_deviceDataChanged", [_this, true]] call EFUNC(common,localEvent);
