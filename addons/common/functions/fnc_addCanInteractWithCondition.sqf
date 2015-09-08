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
 * Public: No
 */
#include "script_component.hpp"

private ["_conditions", "_conditionNames", "_conditionFuncs", "_index"];

params ["_conditionName", "_conditionFunc"];
_conditionName = toLower _conditionName;

_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[]]];

_conditionNames = [_conditions, {_this select 0}] call FUNC(map);

_index = _conditionNames find _conditionName;

if (_index == -1) then {
    _conditions pushBack [_conditionName, _conditionFunc];
} else {
    _conditions set [_index, [_conditionName, _conditionFunc]] ;
};

GVAR(InteractionConditions) = _conditions;
