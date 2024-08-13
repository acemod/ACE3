#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles guidance input for MCLOS guided missiles.
 *
 * Arguments:
 * 0: Direction (0 = up, 1 = right,...) <NUMBER>
 * 1: Key is pressed (true) or released (false) <BOOL>
 *
 * Return Value:
 * True if missile guidance is active, false if not <BOOL>
 *
 * Example:
 * ["up", true] call ace_missileguidance_fnc_mclosKeyHandler;
 *
 * Public: No
 */
if (isNull GVAR(mclosMissile)) exitWith {false};

params ["_dir", "_keyDown"];

GVAR(mclosInput) set [_dir, parseNumber _keyDown];
true
