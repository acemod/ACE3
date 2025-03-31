#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Modifies the fortify action, shows current budget.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, [], []] call ace_fortify_fnc_modifyAction
 *
 * Public: No
 */

params ["", "_player", "", "_actionData"];

private _actionText = if (ace_trenches_trenchSupplies > 0) then {
    format ["%1 [%2]", "Fortify", ace_trenches_trenchSupplies];
} else {
    "Fortify";
};

_actionData set [1, _actionText];