#include "script_component.hpp"
/*
 * Author: nomisum
 * Function for animating ropes (first introduced for GM Bo 105).
 * Original onCut runs when _stowing_ FRIES.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Amount of time to wait for animation to finish <NUMBER>
 *
 * Example:
 * [_vehicle] call ace_compat_gm_fnc_onCutRopes
 *
 * Public: No
 */
params ["_vehicle"];

_vehicle animateSource ["swooperRopes_unhide", 1, true];

0
