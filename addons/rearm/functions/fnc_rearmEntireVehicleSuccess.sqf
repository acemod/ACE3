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

if !(local _vehicle) exitWith { // TODO if there are players inside the turrets they will not be rearmed due to locality issues
    [_this, QFUNC(rearmEntireVehicleSuccess), _vehicle] call EFUNC(common,execRemoteFnc);
};

if (isServer) then {
    {
        _turretOwnerID = _target turretOwner _x;
        EGVAR(common,remoteFnc) = [[_vehicle, _x], QFUNC(rearmEntireVehicleSuccesssLocal), 0];
        _turretOwnerID publicVariableClient QEGVAR(common,remoteFnc);
    } count REARM_TURRET_PATHS;
} else {
    [_this, QUOTE(DFUNC(rearmEntireVehicleSuccess)), 1] call EFUNC(common,execRemoteFnc);
};
