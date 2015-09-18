/*
 * Author: commy2
 * Check if the unit can interact.
 *
 * Arguments:
 * 0: The player. <OBJECT>
 * 1: The interaction target. objNull to ignore. <OBJECT>
 * 2: Exceptions. What general conditions are to skip? (default: []) <ARRAY>
 *
 * Return Value:
 * Unit can interact?
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_target", ["_exceptions", []]];

private ["_exceptions", "_owner"];

_exceptions = [_exceptions, {toLower _this}] call FUNC(map);

_owner = _target getVariable [QGVAR(owner), objNull];

// exit if the target is not free to interact
if (!isNull _owner && {_unit != _owner}) exitWith {false};

// check general conditions
private ["_conditions", "_canInteract"];

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];

_conditions params ["_conditionNames", "_conditionFuncs"];

_canInteract = true;
{
    if (!(_x in _exceptions) && {!([_unit, _target] call (_conditionFuncs select _forEachIndex))}) exitWith {
        _canInteract = false;
    };
} forEach _conditionNames;

_canInteract
