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
    TIME_PROGRESSBAR(REFUEL_PROGRESS_DURATION),
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
        private _helper = _nozzle getVariable [QGVAR(helper), objNull];
        if !(isNull _helper) then {
            deleteVehicle _helper;
        };
        deleteVehicle _nozzle;

        [_target, "blockEngine", "ACE_Refuel", false] call EFUNC(common,statusEffect_set);
    },
    "",
    localize LSTRING(ReturnAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);

true
