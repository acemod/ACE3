/*
 * Author: GitHawk
 * Rearm an entire vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank] call ace_rearm_fnc_rearmEntireVehicleSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_turretPath", "_magazines", "_magazine", "_currentMagazines", "_maxMagazines", "_maxRounds", "_currentRounds"];
params ["_vehicle"];

if (isServer) then {
    {
        _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [[_vehicle, _x], QFUNC(rearmEntireVehicleSuccessLocal), _target] call EFUNC(common,execRemoteFnc);
        } else {
            EGVAR(common,remoteFnc) = [[_vehicle, _x], QFUNC(rearmEntireVehicleSuccessLocal), 0];
            _turretOwnerID publicVariableClient QEGVAR(common,remoteFnc);
        };
    } count REARM_TURRET_PATHS;
} else {
    [_this, QFUNC(rearmEntireVehicleSuccess), 1] call EFUNC(common,execRemoteFnc);
};
