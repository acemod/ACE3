#include "..\script_component.hpp"
/*
 * Author: commy2
 * Check if an object is burning.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Is Burning <BOOL>
 *
 * Example:
 * player call ace_fire_fnc_isBurning
 *
 * Public: Yes
 */

params [["_object", objNull, [objNull]]];

(_object getVariable [QGVAR(intensity), 0]) > BURN_MIN_INTENSITY
