#include "script_component.hpp"
/*
 * Author: GitHawk
 * Rearm an entire vehicle.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, tank] call ace_rearm_fnc_rearmEntireVehicleSuccess
 *
 * Public: No
 */

params ["_truck", "_vehicle"];
TRACE_2("rearmEntireVehicleSuccess",_truck,_vehicle);

if (isServer) then {
    private _turrets = [_vehicle] call FUNC(getAllRearmTurrets);
    {
        private _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], [_vehicle]] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], _turretOwnerID] call CBA_fnc_ownerEvent;
        };
        false
    } count _turrets;
} else {
    [QGVAR(rearmEntireVehicleSuccessEH), _this] call CBA_fnc_serverEvent;
};
