#include "..\script_component.hpp"
/*
 * Author: Smith
 * Handles rotation of object to unload.
 *
 * Arguments:
 * 0: Scroll amount <NUMBER>
 *
 * Return Value:
 * If the scroll was handled <BOOL>
 *
 * Example:
 * 1.2 call ace_cargo_fnc_handleScrollWheel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {false};

params ["_scroll"];

// Change direction
if (CBA_events_control) exitWith {
    GVAR(deployDirection) = GVAR(deployDirection) + (_scroll * 5);

    true
};

// Change height
if (CBA_events_alt) exitWith {
    GVAR(deployHeight) = 2 min (-2 max GVAR(deployHeight) + (_scroll * 0.1));

    true
};

// Change distance
GVAR(deployDistance) = MAX_LOAD_DISTANCE min (1 max GVAR(deployDistance) + (_scroll * 0.1));

true
