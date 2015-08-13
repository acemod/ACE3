/*
 * Author: commy2
 *
 * Remove a condition that gets checked by ace_common_fnc_canInteractWith.
 *
 * Arguments:
 * 0: The conditions id. (String)
 *
 * Return Value:
 * Unit can interact?
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_conditions", "_conditionNames", "_conditionFuncs", "_index"];
params ["_conditionName"];
_conditionName = toLower _conditionName;

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];

_conditions params ["_conditionNames", "_conditionFuncs"];

_index = _conditionNames find _conditionName;

if (_index == -1) exitWith {};

_conditionNames deleteAt _index;
_conditionFuncs deleteAt _index;

GVAR(InteractionConditions) = [_conditionNames, _conditionFuncs];
