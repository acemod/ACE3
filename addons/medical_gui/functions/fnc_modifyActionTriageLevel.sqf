#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Modifies the action color to match the triage level.
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
 * [cursorObject, player, [], []] call ace_interaction_fnc_modifyActionTriageLevel
 *
 * Public: No
 */

params ["_target", "_player", "", "_actionData"];
_actionData params ["", "", "_style"];
_style params ["_icon"];

private _color = switch (_target getVariable [QEGVAR(medical,triageLevel),0]) do {
    case 1: {[TRIAGE_COLOR_MINIMAL]};
    case 2: {[TRIAGE_COLOR_DELAYED]};
    case 3: {[TRIAGE_COLOR_IMMEDIATE]};
    case 4: {[TRIAGE_COLOR_DECEASED]};
    default {[1,1,1,1]};
};

_actionData set [2, [_icon, _color call BIS_fnc_colorRGBtoHTML]];
