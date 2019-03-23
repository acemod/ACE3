#include "script_component.hpp"
/*
 * Author: 654wak654, mharis001
 * Modifies interaction icon color of vehicle selection to show its current damage.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player (not used) <OBJECT>
 * 2: Args <Any>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, ACE_player, [], []] call ace_repair_fnc_modifySelectionInteraction
 *
 * Public: No
 */

params ["_target", "", "_args", "_actionData"];

// Convert damage to number (round up to show even slight damage)
private _color = ceil linearConversion [0, 1, _target getHitPointDamage (_args select 0), 0, 8, true];
TRACE_2("Modifying icon color",_target,_color);
(_actionData select 2) set [1, DAMAGE_COLOR_SCALE select _color];
