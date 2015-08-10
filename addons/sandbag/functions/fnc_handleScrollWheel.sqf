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
#include "script_component.hpp"

params ["_scroll"];

if (GETMVAR(ACE_Modifier,0) == 0 || GVAR(deployPFH) == -1) exitWith { false };

GVAR(deployDirection) = GVAR(deployDirection) + (_scroll * 5);

true
