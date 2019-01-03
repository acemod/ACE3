#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Runs when Dragon is fired
 *
 * Arguments:
 * 0: None
 * 1: The weapon that was fired <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [any, vehicle player] call ace_dragon_fnc_onFired;
 *
 * Public: No
 *
 */
params["_unit"];
_unit setVariable [QGVAR(fired), true, true];
_unit animate ["missile_hide", 1];

