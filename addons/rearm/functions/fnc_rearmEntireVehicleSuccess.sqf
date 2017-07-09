/*
 * Author: GitHawk
 * Rearm an entire vehicle.
 *
 * Arguments:
 * 0: Rearm information <ARRAY>
 *   0: Ammo Truck <OBJECT>
 *   1: Vehicle <OBJECT>
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
    private _turrets = [_vehicle] call FUNC(getAllTurrets);
    {
        private _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], _truck] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], _turretOwnerID] call CBA_fnc_ownerEvent;
        };
        false
    } count _turrets;
} else {
    [QGVAR(rearmEntireVehicleSuccessLocalEH), _this] call CBA_fnc_serverEvent;
};
