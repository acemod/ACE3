/*
 * Author: Ruthberg
 * Clears the muzzle velocity data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_clear_muzzle_velocity_data
 *
 * Public: No
 */
#include "script_component.hpp"

// Temperatures
{ctrlSetText [_x, "0"]} forEach [160021, 160022, 160023, 160024, 160025, 160026, 160027];
// Muzzle velocities
{ctrlSetText [_x, "0"]} forEach [160031, 160032, 160033, 160034, 160035, 160036, 160037];
