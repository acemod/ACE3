#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Clears the c1 ballistic coefficient data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_clear_c1_ballistic_coefficient_data
 *
 * Public: No
 */

// Distances
{ctrlSetText [_x, "0"]} forEach [170021, 170022, 170023, 170024, 170025, 170026, 170027];
// Ballistic Coefficients
{ctrlSetText [_x, "0"]} forEach [170031, 170032, 170033, 170034, 170035, 170036, 170037];
