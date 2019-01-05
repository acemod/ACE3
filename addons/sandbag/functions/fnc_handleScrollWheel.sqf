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

if (GVAR(deployPFH) == -1) exitWith {false};

params ["_scroll"];

GVAR(deployDirection) = GVAR(deployDirection) + (_scroll * 5);

true
