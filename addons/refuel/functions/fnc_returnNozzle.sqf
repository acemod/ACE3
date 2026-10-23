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

params ["_unit", "_source"];

private _nozzle = _unit getVariable [QGVAR(nozzle), objNull];

if (isNull _nozzle || {_source != _nozzle getVariable [QGVAR(source), objNull]}) exitWith {};

[
    GVAR(progressDuration),
    [_unit, _source, _nozzle],
    {
        (_this select 0) params ["_unit", "_source", "_nozzle"];

        _unit setVariable [QGVAR(nozzle), nil, true];
        _unit setVariable [QGVAR(isRefueling), nil, true];

        _source setVariable [QGVAR(isConnected), false, true];
        _source setVariable [QGVAR(ownedNozzle), nil, true];

        private _rope = _nozzle getVariable [QGVAR(rope), objNull];

        if (!isNull _rope) then {
            ropeDestroy _rope;
        };

        private _helper = _nozzle getVariable [QGVAR(helper), objNull];

        if (!isNull _helper) then {
            deleteVehicle _helper;
        };

        detach _nozzle;
        deleteVehicle _nozzle;

        // Restore ability to drag and carry this object
        _source setVariable [QEGVAR(dragging,canCarry), _source getVariable [QGVAR(canCarryLast), false], true];
        _source setVariable [QEGVAR(dragging,canDrag),  _source getVariable [QGVAR(canDragLast),  false], true];

        [_source, "blockEngine", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
    },
    {
        ((_this select 0) call EFUNC(interaction,getInteractionDistance)) <= REFUEL_ACTION_DISTANCE &&
        {(_this select 0) call FUNC(canReturnNozzle)}
    },
    LLSTRING(returnAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call EFUNC(common,progressBar);
