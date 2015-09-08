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
#include "script_component.hpp"

params ["_scroll"];

if (GETMVAR(ACE_Modifier,0) == 0 || GVAR(adjustPFH) == -1) exitWith { false };

GVAR(height) = 0 max (GVAR(height) + (_scroll / 20)) min 1;

true
