/*
 * Author: Jonpas
 * Check if the player can stand up (is in sitting position).
 *
 * Arguments:
 * Player <OBJECT>
 *
 * Return Value:
 * Can Stand Up <BOOL>
 *
 * Example:
 * player call ace_sitting_fnc_canStand;
 *
 * Public: No
 */
#include "script_component.hpp"

// If sitting
if (_this getVariable [QGVAR(sitting),false]) exitWith {true};

// Default
false
