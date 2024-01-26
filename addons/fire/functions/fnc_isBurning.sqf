#include "..\script_component.hpp"
/*
 * Author: commy2
 * Check if unit is burning.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_fire_fnc_isBurning
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

(_unit getVariable [QGVAR(intensity), 0]) > BURN_MIN_INTENSITY
