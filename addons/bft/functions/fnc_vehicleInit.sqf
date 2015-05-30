/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_vehicle);

systemChat format["VehicleInit: %1",_this];
diag_log format["VehicleInit: %1",_this];

if !(isServer) exitwith {};

private ["_devices"];
_devices = _vehicle getvariable [QGVAR(vehicleDevices), getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(vehicleDevices))];

systemChat format["VehicleInit devices: %1",_devices];
diag_log format["VehicleInit devices: %1",_devices];

{
    if (isClass (configFile >> "ACE_BFT" >> "Devices" >> _x)) then {
        ["bft_itemCreated", [_vehicle, _x, "", format["%1/%2",_vehicle, _x]]] call EFUNC(common,serverEvent);
    };
} forEach _devices;

