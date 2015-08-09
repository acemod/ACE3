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

private ["_ownedDevices"];
params ["_object"];
if (!isServer) exitwith {};

_ownedDevices = _object getvariable [QGVAR(ownedDevices), []];

{
    ["bft_vehicleDeviceKilled", [_x]] call EFUNC(common,globalEvent);
}foreach _ownedDevices;

