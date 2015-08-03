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
 * Unit can interact?
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_exceptions"];

params ["_unit", "_target"];

_exceptions = if (count _this > 2) then {
    _this select 2;
} else {
    [];
};

_exceptions = [_exceptions, {toLower _this}] call FUNC(map);

// exit if the target is not free to interact
private "_owner";
_owner = _target getVariable [QGVAR(owner), objNull];

if (!isNull _owner && {_unit != _owner}) exitWith {false};

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
