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
 * [1.2] call ace_tripod_fnc_handleScrollWheel;
 *
 * Public: No
 */

params ["_scroll"];

if (GVAR(adjustPFH) == -1) exitWith {false};

GVAR(height) = 0 max (GVAR(height) + (_scroll / 20)) min 1;

true
