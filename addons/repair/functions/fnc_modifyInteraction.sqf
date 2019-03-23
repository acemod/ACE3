#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Modifies the base interaction point for repair items to show its current damage.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player (not used) <OBJECT>
 * 2: Args (not used) <Any>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, ACE_player, [], []] call ace_repair_fnc_modifyInteraction
 *
 * Public: No
 */

params ["_target", "", "", "_actionData"];

// Convert damage to number (round up to show even slight damage)
private _color = ceil linearConversion [0, 1, damage _target, 0, 8, true];
TRACE_2("Modifying icon color",_target,_color);
(_actionData select 2) set [1, DAMAGE_COLOR_SCALE select _color];
    
