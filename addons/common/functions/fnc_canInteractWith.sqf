/*
 * Author: commy2
 *
 * Check if the unit can interact.
 *
 * Arguments:
 * 0: The player. (Object)
 * 1: The interaction target. objNull to ignore. (Object)
 * 2: Exceptions. What general conditions are to skip? (Array)
 *
 * Return Value:
 * Unit can interact?
 *
 */
#include "script_component.hpp"

private ["_unit", "_target", "_exceptions"];

_unit = _this select 0;
_target = _this select 1;
_exceptions = _this select 2;

_exceptions = [_exceptions, {toLower _this}] call FUNC(map);

// exit if the target is not free to interact
private "_owner";
_owner = _target getVariable [QGVAR(owner), objNull];

if (!isNull _owner && {_unit != _owner} && {!([_owner] call FUNC(isPlayer))}) exitWith {false};

// check general conditions

private ["_conditions", "_conditionNames", "_conditionFuncs"];

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];

_conditionNames = _conditions select 0;
_conditionFuncs = _conditions select 1;

private "_canInteract";
_canInteract = true;

{
    if (!(_x in _exceptions) && {!([_unit, _target] call (_conditionFuncs select _forEachIndex))}) exitWith {
        _canInteract = false;
    };
} forEach _conditionNames;

_canInteract
