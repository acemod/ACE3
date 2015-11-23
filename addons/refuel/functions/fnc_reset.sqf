/*
 * Author: GitHawk
 * Resets a fuel vehicle in case is got bugged
 *
 * Arguments:
 * 0: Fuel truck <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [truck] call ace_refuel_fnc_reset
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_nozzle", "_nozzleTarget", "_rope"];
params ["_target"];

if (local _target) then {
    _target setHitPointDamage ["HitEngine", _target getVariable [QGVAR(engineHit), 0]];
} else {
    [[_target, ["HitEngine", _target getVariable [QGVAR(engineHit), 0]]], "{(_this select 0) setHitPointDamage (_this select 1)}", _target] call EFUNC(common,execRemoteFnc);
};
_target setVariable [QGVAR(engineHit), nil, true];
_target setVariable [QGVAR(isConnected), false, true];

_nozzle = _target getVariable [QGVAR(ownedNozzle), nil];
if !(isNil "_nozzle") then {
    _nozzleTarget = _nozzle getVariable [QGVAR(sink), nil];
    if !(isNil "_nozzleTarget") then {
        _nozzleTarget setVariable [QGVAR(nozzle), nil, true];
    };

    _rope = _nozzle getVariable [QGVAR(rope), nil];
    if !(isNil "_rope") then {
        ropeDestroy _rope;
    };

    {
        if (local _x) then {
            [_x, _nozzle] call FUNC(resetLocal);
        } else {
            [[_x, _nozzle], "{_this call FUNC(resetLocal)}", _x] call EFUNC(common,execRemoteFnc);
        };
    } count allPlayers;
    deleteVehicle _nozzle;
};
_target setVariable [QGVAR(ownedNozzle), nil, true];
