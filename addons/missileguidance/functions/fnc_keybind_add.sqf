#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Adds keybind handlers
 *
 * Arguments:
 * 0: Type of keybind <STRING>
 * 1: Down handler code <CODE>
 * 2: Up handler code <CODE>
 *
 * Returns:
 * None
 *
 * Example:
 * ["left", {hint "Down"}, {hint "Up"}] call ace_missileguidance_fnc_keybind_add
 *
 * Public: No
 */
params ["_type", "_down", "_up"];

(GVAR(keybinds) get _type) params ["_downArray", "_upArray"];
if (_down isNotEqualTo {}) then { _downArray pushBack _down; };
if (_up isNotEqualTo {}) then { _upArray pushBack _up; };
