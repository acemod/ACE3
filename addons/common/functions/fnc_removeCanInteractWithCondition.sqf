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
 */
#include "script_component.hpp"

params ["_conditionName"];
_conditionName = toLower _conditionName;

private ["_conditions", "_conditionNames", "_conditionFuncs"];

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];

_conditionNames = _conditions select 0;
_conditionFuncs = _conditions select 1;

private "_index";
_index = _conditionNames find _conditionName;

if (_index == -1) exitWith {};

_conditionNames deleteAt _index;
_conditionFuncs deleteAt _index;

GVAR(InteractionConditions) = [_conditionNames, _conditionFuncs];
