/*
 * Author: GitHawk
 * Rearm an entire vehicle.
 *
 * Arguments:
 * 0: Rearm information <ARRAY>
 *   0: Ammo Truck <OBJECT>
 *   1: Vehicle <OBJECT
 *
 * Return Value:
 * None
 *
 * Example:
 * [[ammo_truck, tank]] call ace_rearm_fnc_rearmEntireVehicleSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args"];
_args params [
    ["_truck", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

if (isServer) then {
    {
        _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), _truck, [_truck, _vehicle, _x]] call EFUNC(common,objectEvent);
        } else {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), _turretOwnerID, [_truck, _vehicle, _x]] call EFUNC(common,targetEvent);
        };
        false
    } count REARM_TURRET_PATHS;
} else {
    [QGVAR(rearmEntireVehicleSuccessLocalEH), _this] call EFUNC(common,serverEvent);
};
