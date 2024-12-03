#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Checks if the boat can be pushed.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Can Push <BOOL>
 *
 * Example:
 * cursorObject call ace_interaction_fnc_canPush
 *
 * Public: No
 */

params ["_target"];

alive _target &&
{getMass _target <= 2600 || getNumber (configOf _target >> QGVAR(canPush)) == 1} &&
{vectorMagnitude velocity _target < 3} &&
{isNull isVehicleCargo _target} // Check if vehicle is loaded as ViV cargo
