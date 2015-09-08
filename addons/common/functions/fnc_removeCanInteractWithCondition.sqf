/*
 * Author: commy2
 *
 * Remove a condition that gets checked by ace_common_fnc_canInteractWith.
 *
 * Arguments:
 * 0: The conditions id. <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_conditions", "_conditionNames", "_conditionFuncs", "_index"];

params ["_conditionName"];
_conditionName = toLower _conditionName;

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [["",{}]]];

_conditionNames = [_conditions, {_this select 0}] call FUNC(map);

_index = _conditionNames find _conditionName;

if (_index == -1) exitWith {};

_conditions deleteAt _index;

GVAR(InteractionConditions) = _conditions;
