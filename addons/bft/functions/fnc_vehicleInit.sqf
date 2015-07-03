/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * TRUE <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_vehicle);

systemChat format["VehicleInit: %1",_this];
diag_log format["VehicleInit: %1",_this];

if !(isServer) exitwith {};

private ["_device"];
_device = _vehicle getvariable [QGVAR(vehicleDevice), getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(vehicleDevice))];

systemChat format["VehicleInit devices: %1",_device];
diag_log format["VehicleInit devices: %1",_device];

if (isClass (configFile >> "ACE_BFT" >> "Devices" >> _device)) then {
    ["bft_itemCreated", [_vehicle, _device, "", format["%1/%2",_vehicle, _device]]] call EFUNC(common,serverEvent);
};

true