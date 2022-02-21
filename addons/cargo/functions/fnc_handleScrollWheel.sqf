#include "script_component.hpp"
/*
 * Author: Smith
 * Handles object to unload rotation.
 *
 * Arguments:
 * 0: scroll amount <NUMBER>
 *
 * Return Value:
 * handled <BOOL>
 *
 * Example:
 * [1.2] call ace_cargo_fnc_handleScrollWheel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {false};

params ["_scroll"];

if (cba_events_control) exitWith {
    GVAR(deployDirection) = GVAR(deployDirection) + (_scroll * 5);
    true
};

if (cba_events_alt) exitWith {
    GVAR(deployHeight) = 2 min (-2 max GVAR(deployHeight) + (_scroll * 0.1));
    true
};

GVAR(deployDistance) = 4 min (1 max GVAR(deployDistance) + (_scroll * 0.1));
true
