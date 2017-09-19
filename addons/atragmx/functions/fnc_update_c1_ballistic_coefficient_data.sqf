/*
 * Author: Ruthberg
 * Updates the c1 ballistic coefficient data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_c1_ballistic_coefficient_data
 *
 * Public: No
 */
#include "script_component.hpp"

// Distances
if (GVAR(currentUnit) != 1) then {
    {ctrlSetText [_x, Str(Round(((GVAR(workingMemory) select 19) select _forEachIndex) select 0))]} forEach [170021, 170022, 170023, 170024, 170025, 170026, 170027];
} else {
    {ctrlSetText [_x, Str(Round((((GVAR(workingMemory) select 19) select _forEachIndex) select 0) * 1.0936133))]} forEach [170021, 170022, 170023, 170024, 170025, 170026, 170027];
};
// Ballistic coefficients
{ctrlSetText [_x, Str(Round((((GVAR(workingMemory) select 19) select _forEachIndex) select 1) * 1000) / 1000)]} forEach [170031, 170032, 170033, 170034, 170035, 170036, 170037];
