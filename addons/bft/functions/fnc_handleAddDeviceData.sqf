#include "script_component.hpp"
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


// [_magID, [_deviceSide, _deviceEncryptionKeys], _assignableInformation, _app, -1, _owner]
diag_log format["added to deviceData: %1", _this];
GVAR(deviceData) pushback _this;

systemChat format["handleAddDeviceData: %1", _this];
diag_log format["handleAddDeviceData: %1", _this];

if (local (_this select 5)) then {
    private _currentDevices = (_this select 5) getvariable [QGVAR(ownedDevices), []];
    if !((_this select 0) in _currentDevices) then {
        _currentDevices pushback (_this select 0);
        (_this select 5) setvariable [QGVAR(ownedDevices), _currentDevices, true];

        GVAR(pendingIdAssignmentList) = GVAR(pendingIdAssignmentList) - [(_this select 0)]; // remove the id from the assignment list
        systemChat format["handleAdd - ownedDevices: %1 %2", (_this select 5), _currentDevices];
        diag_log format["handleAdd - ownedDevices: %1 %2", (_this select 5), _currentDevices];
    };
} else {
    diag_log format["handleAdd - not the owner of device: %1", (_this select 5)];
};

["bft_deviceDataChanged", [_this, true]] call CBA_fnc_localEvent;
