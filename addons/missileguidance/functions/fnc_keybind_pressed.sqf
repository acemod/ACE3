#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles keybind press/release events
 *
 * Arguments:
 * 0: Type of keybind <STRING>
 * 1: Action ("down" or "up") <STRING>
 *
 * Returns:
 * Block Input <BOOL>
 *
 * Example:
 * ["left", "down"] call ace_missileguidance_fnc_keybind_pressed
 *
 * Public: No
 */
params ["_type", "_action"];

// ["_downArray", "_upArray"]
private _codeArray = (GVAR(keybinds) get _type) select (_action == "up");
private _results = _codeArray apply { call _x };
_results find true != -1 // if any of the keybind handlers returned true
