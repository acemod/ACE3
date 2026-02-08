#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, Smith
 * Handles sandbag rotation.
 *
 * Arguments:
 * 0: Scroll amount <NUMBER>
 *
 * Return Value:
 * If the scroll was handled <BOOL>
 *
 * Example:
 * 1.2 call ace_sandbag_fnc_handleScrollWheel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {
    false // return
};

params ["_scroll"];

// Change direction
if (CBA_events_control) exitWith {
    GVAR(deployDirection) = GVAR(deployDirection) + (_scroll * 5);

    true // return
};

// Change height
if (CBA_events_alt) exitWith {
    GVAR(deployHeight) = 1.5 min (-1.5 max (GVAR(deployHeight) + (_scroll * 0.1)));

    true // return
};

// Change distance
GVAR(deployDistance) = 1.5 min (0.36 max (GVAR(deployDistance) + (_scroll * 0.1)));

true // return
