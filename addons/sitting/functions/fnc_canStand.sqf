#include "script_component.hpp"
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
 * player call ace_sitting_fnc_canStand
 *
 * Public: No
 */

params ["_player"];

// Sitting
!isNil {_player getVariable QGVAR(sittingStatus)}
