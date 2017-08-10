/*
 * Author: PabstMirror
 * Modifies the base interaction point for repair items to show it's current damage.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <Any>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, ace_player, [], []] call ace_repair_fnc_modifyInteraction;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_player", "_args", "_actionData"];
TRACE_4("params",_target,_player,_args,_actionData);

// Interaction dots numbered 0..8, white to red.
// Convert damage to number (rounding up), so that even slight damage can bee seen

private _fileName = format [QPATHTOF(ui\damage_%1_ca.paa), ceil (linearConversion [0, 1, damage _target, 0, 8, true])];
_actionData set [2, _fileName];
