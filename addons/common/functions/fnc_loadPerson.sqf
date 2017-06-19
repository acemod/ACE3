/*
 * Author: Glowbal
 * Loads a specified unit into any nearby vehicle
 *
 * Arguments:
 * 0: Unit that will load <OBJECT>
 * 1: Unit to be loaded <OBJECT>
 *
 * Return Value:
 * the vehicle that the unitToBeloaded has been loaded in. Returns ObjNull if function failed <OBJECT>
 *
 * Example:
 * [bob, kevin] call ace_common_fnc_loadPerson
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define GROUP_SWITCH_ID QFUNC(loadPerson)

params ["_caller", "_unit"];

private _vehicle = objNull;

if (!([_caller, _unit, ["isNotDragging", "isNotCarrying"]] call FUNC(canInteractWith)) || {_caller == _unit}) exitWith {_vehicle};

private _nearVehicles = nearestObjects [_unit, ["Car", "Air", "Tank", "Ship_F"], 10];

{
    TRACE_1("",_x);
    if ((_x emptyPositions "cargo" > 0) || {_x emptyPositions "gunner" > 0}) exitWith {
        _vehicle = _x;
    };
} forEach _nearVehicles;

if (!isNull _vehicle) then {
    [_unit, true, GROUP_SWITCH_ID, side group _caller] call FUNC(switchToGroupSide);
    ["ace_loadPersonEvent", [_unit, _vehicle, _caller], _unit] call CBA_fnc_targetEvent;
};

_vehicle
