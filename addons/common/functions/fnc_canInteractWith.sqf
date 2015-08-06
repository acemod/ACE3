/*
 * Author: commy2
 * Check if the unit can interact.
 *
 * Arguments:
 * 0: The player. <OBJECT>
 * 1: The interaction target. objNull to ignore. <OBJECT>
 * 2: Exceptions. What general conditions are to skip? <ARRAY> (Optional)
 *
 * Return Value:
 * Can Unit Interact With Something(BOOLEAN)
 *
 * Public: No
 */
#include "script_component.hpp"
scopeName "main";
private ["_exceptions", "_owner", "_conditions", "_conditionNames", "_conditionFuncs", "_canInteract"];

params ["_unit", "_target", ["_exceptions",[]]];

_exceptions = [_exceptions, {toLower _this}] call FUNC(map);

// exit if the target is not free to interact
_owner = _target getVariable [QGVAR(owner), objNull];

if (!isNull _owner && {_unit != _owner}) exitWith {false};

// check general conditions

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];
_conditions params ["_conditionNames","_conditionFuncs"];

_canInteract = true;

{
    if (!(_x in _exceptions) && {!([_unit, _target] call (_conditionFuncs select _forEachIndex))}) exitWith {
        _canInteract = false;
        breakTo "main";
    };
} forEach _conditionNames;

_canInteract
