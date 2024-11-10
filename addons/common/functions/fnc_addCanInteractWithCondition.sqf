#include "..\script_component.hpp"
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

_conditionName = toLowerANSI _conditionName;
GVAR(InteractionConditions) set [_conditionName, _conditionFunc];
