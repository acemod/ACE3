#include "script_component.hpp"
/*
 * Author: Brett Mayson
 * Statement to sort magazines by their ammo count.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Sorting Value <NUMBER>
 *
 * Public: No
*/

params ["_config"];

getNumber (_config >> "count")
