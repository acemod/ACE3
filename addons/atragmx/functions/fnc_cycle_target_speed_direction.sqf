/*
 * Author: Ruthberg
 * Cycles through the target directions left/right
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_cycle_target_direction
 *
 * Public: No
 */
#include "script_component.hpp"

if ((ctrlText 140051) == ">") then {
    ctrlSetText [140051, "<"];
} else {
    ctrlSetText [140051, ">"];
};
