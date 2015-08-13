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



_conditions = missionNamespace getVariable [QGVAR(InteractionConditions), [[],[]]];
_conditions params ["_conditionNames","_conditionFuncs"];

_index = _conditionNames find _conditionName;

if (_index == -1) then {
    _index = count _conditionNames;
    _conditionNames set [_index, _conditionName];
    _conditionFuncs set [_index, _conditionFunc];
} else {
    _conditionNames pushBack _conditionName;
    _index = _conditionFuncs pushBack _conditionFunc;
};

GVAR(InteractionConditions) = [_conditionNames, _conditionFuncs];
