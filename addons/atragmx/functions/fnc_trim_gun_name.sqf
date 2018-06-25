#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Trims the gun name input field
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_trim_gun_name
 *
 * Public: No
 */

ctrlSetText [11001, (ctrlText 11001) select [0, 14]];
