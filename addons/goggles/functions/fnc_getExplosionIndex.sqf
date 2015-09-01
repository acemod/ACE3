/*
 * Author: Garth 'L-H' de Wet
 * Turns 0-1 damage of explosion Event into a rating system of 0-3
 *
 * Arguments:
 * 0: The amount of damage <NUMBER>
 *
 * Return Value:
 * The rating [0-3] <NUMBER>
 *
 * Example:
 * 0.05 call ace_goggles_fnc_getExplosionIndex;
 *
 * Public: No
 */
#include "script_component.hpp"
floor (linearConversion [0, 0.1, _this, 0, 3, true])
