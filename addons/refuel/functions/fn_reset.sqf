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

params ["_target"];

if !(local _target) then {
    [[_target, ["HitEngine", _target getVariable [QGVAR(engineHit), 0]]], "{(_this select 0) setHitPointDamage (_this select 1)}", _sink] call EFUNC(common,execRemoteFnc);
} else {
    _target setHitPointDamage ["HitEngine", _target getVariable [QGVAR(engineHit), 0]];
};
_target setVariable [QGVAR(engineHit), nil, true];
_target setVariable [QGVAR(isConnected), false, true];

_nozzle = _target getVariable [QGVAR(nozzle), nil];
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
        // FIXME needs to be done locally
        _actionID = _x getVariable [QGVAR(ReleaseActionID), -1];
        if (_actionID != -1) then {
            _x removeAction _actionID;
            _x setVariable [QGVAR(isRefueling), false, true];
            _x setVariable [QGVAR(ReleaseActionID), nil];
        };
    } count allPlayers;
    deleteVehicle _nozzle;
};
_target getVariable [QGVAR(nozzle), nil, true];
