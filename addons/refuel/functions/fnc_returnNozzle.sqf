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

private ["_nozzle", "_dummy", "_actionID"];
params ["_unit", "_target"];

_nozzle = _unit getVariable QGVAR(nozzle);
_source = _nozzle getVariable QGVAR(source);

if (isNil "_nozzle" || {_source != _target}) exitWith {false};

[
    2,
    [_unit, _nozzle, _target],
    {
        private "_actionID";
        params ["_args"];
        _args params ["_unit", "_nozzle", "_target"];
        _unit setVariable [QGVAR(nozzle), nil];
        detach _nozzle;
        [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
        REFUEL_UNHOLSTER_WEAPON
        _unit setVariable [QGVAR(isRefueling), false];
        _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
        if (_actionID != -1) then {
            _unit removeAction _actionID;
            _unit setVariable [QGVAR(ReleaseActionID), nil];
        };

        _target setVariable [QGVAR(isConnected), false, true];
        ropeDestroy (_nozzle getVariable QGVAR(rope));
        deleteVehicle _nozzle;

        _target setHitPointDamage ["HitEngine", _target getVariable [QGVAR(engineHit), 0]];
        _target setVariable [QGVAR(engineHit), nil, true];
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);

true
