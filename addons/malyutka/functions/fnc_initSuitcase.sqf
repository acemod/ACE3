#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initialise suitcase launcher
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_initSuitcase
 *
 * Public: No
 */
params ["_suitcase"];

_suitcase setVariable [QGVAR(plugTaken), false, true];
_suitcase setVariable [QGVAR(plugRope), objNull, true];
_suitcase setVariable [QGVAR(plugHeader), objNull, true];
_suitcase setVariable [QGVAR(attachedToPlugNumber), -1, true];

