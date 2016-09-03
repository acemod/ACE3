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

params ["_object"];
if (!isServer) exitwith {};

systemChat format["handleKilled: %1 ", _object];
diag_log format["handleKilled: %1 ", _object];
private _ownedDevices = _object getvariable [QGVAR(ownedDevices), []];

{
    systemChat format["raising event vehicleDeviceKilled: %1 ", _x];
    diag_log format["raising event vehicleDeviceKilled: %1 ", _x];
    ["bft_vehicleDeviceKilled", [_x]] call EFUNC(common,globalEvent);
} forEach _ownedDevices;
