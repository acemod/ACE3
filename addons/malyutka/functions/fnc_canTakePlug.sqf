#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Whether or not we can take the plug from the launch suitcase
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_canTakePlug
 *
 * Public: No
 */
params ["_unit", "_target"];
(alive _target) && !(_target getVariable QGVAR(plugTaken))

