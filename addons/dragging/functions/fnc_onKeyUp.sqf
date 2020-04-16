#include "script_component.hpp"
/*
 * Author: bux
 * Key up event.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Key <NUMBER>
 * 2: Shift <BOOL>
 * 3: Ctrl <BOOL>
 * 4: Alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

// EH is always assigned. Exit and don't overwrite input if not carrying
if !(ace_player getVariable [QGVAR(isCarrying), false]) exitWith {false};

params ["", "_key", "_shift", "_ctrl", "_alt"];

// it's enough to always reset it to false
// holding down Ctrl will fire the keyDown event often enough
GVAR(ctrlHeld) = false;
