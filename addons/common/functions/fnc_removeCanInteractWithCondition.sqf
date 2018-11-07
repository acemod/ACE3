#include "script_component.hpp"
/*
 * Author: commy2
 * Remove a condition that gets checked by ace_common_fnc_canInteractWith.
 *
 * Arguments:
 * 0: The conditions id. <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ID"] call ace_common_fnc_removeCanInteractWithCondition
 *
 * Public: No
 */

params ["_conditionName"];

_conditionName = toLower _conditionName;

private _conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];

_conditions params ["_conditionNames", "_conditionFuncs"];

private _index = _conditionNames find _conditionName;

if (_index == -1) exitWith {};

_conditionNames deleteAt _index;
_conditionFuncs deleteAt _index;

GVAR(InteractionConditions) = _conditions;
