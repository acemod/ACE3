/*
 * Author: GitHawk
 * Rearm an entire vehicle.
 *
 * Arguments:
 * 0: Rearm information <ARRAY>
 *   0: Target <OBJECT>
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
_args params [["_target", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];

if (isServer) then {
    {
        _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [[_target, _vehicle, _x], QFUNC(rearmEntireVehicleSuccessLocal), _target] call EFUNC(common,execRemoteFnc);
        } else {
            EGVAR(common,remoteFnc) = [[_target, _vehicle, _x], QFUNC(rearmEntireVehicleSuccessLocal), 0];
            _turretOwnerID publicVariableClient QEGVAR(common,remoteFnc);
        };
    } count REARM_TURRET_PATHS;
} else {
    [_this, QFUNC(rearmEntireVehicleSuccess), 1] call EFUNC(common,execRemoteFnc);
};
