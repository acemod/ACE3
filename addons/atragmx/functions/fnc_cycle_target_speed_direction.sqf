#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Cycles through the target directions left/right
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_cycle_target_direction
 *
 * Public: No
 */

if ((ctrlText 140051) == ">") then {
    ctrlSetText [140051, "<"];
} else {
    ctrlSetText [140051, ">"];
};
