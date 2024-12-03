#include "..\script_component.hpp"
/*
 * Author: GitHawk, Jonpas
 * Returns the nozzle back to source vehicle.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_returnNozzle
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_source", objNull, [objNull]]];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];

if (isNull _nozzle || {_source != _nozzle getVariable QGVAR(source)}) exitWith {};

[
    GVAR(progressDuration),
    [_unit, _nozzle, _source],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_source", objNull, [objNull]]];
        _unit setVariable [QGVAR(nozzle), nil, true];
        detach _nozzle;
        _unit setVariable [QGVAR(isRefueling), false];

        _source setVariable [QGVAR(isConnected), false, true];
        _source setVariable [QGVAR(ownedNozzle), nil, true];
        private _rope = _nozzle getVariable [QGVAR(rope), objNull];
        if !(isNull _rope) then {
            ropeDestroy _rope;
        };
        private _helper = _nozzle getVariable [QGVAR(helper), objNull];
        if !(isNull _helper) then {
            deleteVehicle _helper;
        };
        deleteVehicle _nozzle;

        // Restore ability to drag and carry this object
        _source setVariable [QEGVAR(dragging,canCarry), _source getVariable [QGVAR(canCarryLast), false], true];
        _source setVariable [QEGVAR(dragging,canDrag),  _source getVariable [QGVAR(canDragLast),  false], true];

        [_source, "blockEngine", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
    },
    "",
    localize LSTRING(ReturnAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call EFUNC(common,progressBar);
