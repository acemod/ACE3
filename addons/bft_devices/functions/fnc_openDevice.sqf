/*
 * Author: Glowbal
 * Open a device if owned
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: Device Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, "myDeviceType"] call ace_bft_devices_fnc_openDevice
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_ownedDevices", "_return", "_deviceData", "_deviceDataToBeOpened"];
params ["_player", "_target", "_targetDeviceType"];

if (GVAR(ifOpenStart) || {GVAR(uavViewActive)} || {!I_CLOSED}) exitWith {false};
// if (_player != _target && {_target isKindOf "CAManBase"}) exitwith {false};

_ownedDevices = [_target] call EFUNC(bft,getOwnedDevices);
diag_log text format["Owned devices by %1 - %2", _target, _ownedDevices];
if (count _ownedDevices == 0) exitwith {false};

_deviceDataToBeOpened = [];
_return = false;
{
    _deviceData = [_x] call EFUNC(bft,getDeviceData);
    if (toLower D_GET_DEVICETYPE(_deviceData) isEqualTo toLower _targetDeviceType) exitwith {
        _deviceDataToBeOpened = _deviceData;
        _return = true;
    };
} forEach _ownedDevices;

if (_return) then {
    _deviceId = D_GET_ID(_deviceDataToBeOpened);
    _interfaces = [_deviceId, _player] call EFUNC(bft,getInterfaces);
    if (count _interfaces == 0) exitwith {};
    _interface = _interfaces select 0;

    _interfaceDisplayName = getText (configFile >> "ACE_BFT" >> "Interfaces" >> _interface >> "dialogName");
    [_deviceID, _interface, 0 /* main interface type */,_interfaceDisplayName, true /*Is Dialog*/, _player, _target] call FUNC(ifOpen);
};
