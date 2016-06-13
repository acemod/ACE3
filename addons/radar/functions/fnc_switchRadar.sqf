/*
 * Author: BaerMitUmlaut
 * Switches the radar on or off.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Key handled <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private _vehicle = vehicle ACE_player;
if !(_vehicle isKindOf "Air") exitWith {false};

if (_vehicle getVariable [QGVAR(radarEnabled), false]) then {
    _vehicle setVariable [QGVAR(radarEnabled), true];
} else {
    _vehicle setVariable [QGVAR(radarEnabled), false];
};

true
