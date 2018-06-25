#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg
 * Handles sandbag rotation
 *
 * Arguments:
 * 0: scroll amount <NUMBER>
 *
 * Return Value:
 * handled <BOOL>
 *
 * Example:
 * [1.2] call ace_sandbag_fnc_handleScrollWheel
 *
 * Public: No
 */

if (GVAR(digPFH) == -1) exitWith {false};

params ["_scroll"];

GVAR(digDirection) = GVAR(digDirection) + (_scroll * 5);

true
