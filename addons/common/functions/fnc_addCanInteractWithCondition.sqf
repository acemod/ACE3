#include "script_component.hpp"
/*
 * Author: commy2
 * Add a condition that gets checked by ace_common_fnc_canInteractWith.
 *
 * Arguments:
 * 0: The conditions id. Used to remove later or as exception name. An already existing name overwrites. <STRING>
 * 1: The condition to check. format of "_this" is "[_player, _target]". <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ID", {Condition}] call ace_common_fnc_addCanInteractWithCondition
 *
 * Public: No
 */

params ["_conditionName", "_conditionFunc"];

_conditionName = toLower _conditionName;

private _conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];
_conditions params ["_conditionNames", "_conditionFuncs"];

private _index = _conditionNames find _conditionName;

if (_index == -1) then {
    _index = count _conditionNames;
};

_conditionNames set [_index, _conditionName];
_conditionFuncs set [_index, _conditionFunc];

GVAR(InteractionConditions) = _conditions;
