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
params [["_vehicle", objNull, [objNull]]];

if (isServer) then {
    {
        _turretOwnerID = _vehicle turretOwner _x;
        if (_turretOwnerID == 0) then {
            [[_vehicle, _x], QFUNC(rearmEntireVehicleSuccessLocal), _target] call CFUNC(execRemoteFnc);
        } else {
            CGVAR(remoteFnc) = [[_vehicle, _x], QFUNC(rearmEntireVehicleSuccessLocal), 0];
            _turretOwnerID publicVariableClient QCGVAR(remoteFnc);
        };
    } count REARM_TURRET_PATHS;
} else {
    [_this, QFUNC(rearmEntireVehicleSuccess), 1] call CFUNC(execRemoteFnc);
};
