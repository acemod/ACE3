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
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]]];

if (local _target) then {
    _target setHitPointDamage ["HitEngine", _target getVariable [QGVAR(engineHit), 0]];
} else {
    [QGVAR(setVehicleHitPointDamage), _target, ["HitEngine", _target getVariable [QGVAR(engineHit), 0]]] call EFUNC(common,targetEvent);
};
_target setVariable [QGVAR(engineHit), nil, true];
_target setVariable [QGVAR(isConnected), false, true];

private _nozzle = _target getVariable [QGVAR(ownedNozzle), nil];
if !(isNil "_nozzle") then {
    private _nozzleTarget = _nozzle getVariable [QGVAR(sink), nil];
    if !(isNil "_nozzleTarget") then {
        _nozzleTarget setVariable [QGVAR(nozzle), nil, true];
    };

    private _rope = _nozzle getVariable [QGVAR(rope), objNull];
    if !(isNull _rope) then {
        ropeDestroy _rope;
    };

    {
        if (local _x) then {
            [_x, _nozzle] call FUNC(resetLocal);
        } else {
            [QGVAR(resetLocal), _x, [_x, _nozzle]] call EFUNC(common,targetEvent);
        };
    } count allPlayers;
    deleteVehicle _nozzle;
};
_target setVariable [QGVAR(ownedNozzle), nil, true];
