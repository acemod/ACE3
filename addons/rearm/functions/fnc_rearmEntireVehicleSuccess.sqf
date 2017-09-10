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
_args params [["_truck", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];
TRACE_2("rearmEntireVehicleSuccess",_truck,_vehicle);

if (isServer) then {
    {
        private _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], [_vehicle]] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], _turretOwnerID] call CBA_fnc_ownerEvent;
        };
        false
    } count REARM_TURRET_PATHS;
} else {
    [QGVAR(rearmEntireVehicleSuccessEH), _this] call CBA_fnc_serverEvent;
};
