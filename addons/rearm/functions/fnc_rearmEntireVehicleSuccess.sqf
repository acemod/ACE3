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
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], _truck] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(rearmEntireVehicleSuccessLocalEH), [_truck, _vehicle, _x], _turretOwnerID] call CBA_fnc_targetEvent;
        };
    } count REARM_TURRET_PATHS;
} else {
    [QGVAR(rearmEntireVehicleSuccessLocalEH), _this] call CBA_fnc_serverEvent;
};
