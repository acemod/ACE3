/*
 * Author: GitHawk, Jonpas
 * Returns the nozzle back to source vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Truck <OBJECT>
 *
 * Return Value:
 * Returned Nozzle <BOOL>
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_returnNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];
private _source = _nozzle getVariable QGVAR(source);

if (isNull _nozzle || {_source != _target}) exitWith {false};

[
    2,
    [_unit, _nozzle, _target],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_target", objNull, [objNull]]];
        _unit setVariable [QGVAR(nozzle), nil, true];
        detach _nozzle;
        [_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
        REFUEL_UNHOLSTER_WEAPON
        _unit setVariable [QGVAR(isRefueling), false];
        private _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
        if (_actionID != -1) then {
            _unit removeAction _actionID;
            _unit setVariable [QGVAR(ReleaseActionID), nil];
        };

        _target setVariable [QGVAR(isConnected), false, true];
        _target setVariable [QGVAR(ownedNozzle), nil, true];
        private _rope = _nozzle getVariable [QGVAR(rope), objNull];
        if !(isNull _rope) then {
            ropeDestroy _rope;
        };
        deleteVehicle _nozzle;

        if !(local _target) then {
            [[_target, ["HitEngine", _target getVariable [QGVAR(engineHit), 0]]], "{(_this select 0) setHitPointDamage (_this select 1)}", _sink] call EFUNC(common,execRemoteFnc);
        } else {
            _target setHitPointDamage ["HitEngine", _target getVariable [QGVAR(engineHit), 0]];
        };
        _target setVariable [QGVAR(engineHit), nil, true];
    },
    "",
    localize LSTRING(ReturnAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);

true
