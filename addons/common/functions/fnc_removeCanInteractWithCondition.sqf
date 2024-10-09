#include "..\script_component.hpp"
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

_conditionName = toLowerANSI _conditionName;
GVAR(InteractionConditions) deleteAt _conditionName;
