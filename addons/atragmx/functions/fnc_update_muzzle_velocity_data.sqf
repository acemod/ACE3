/*
 * Author: Ruthberg
 * Updates the muzzle velocity data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_muzzle_velocity_data
 *
 * Public: No
 */
#include "script_component.hpp"

if (GVAR(currentUnit) == 2) then {
    // Temperatures
    {ctrlSetText [_x, Str(Round((((GVAR(workingMemory) select 18) select _forEachIndex) select 0) * 10) / 10)]} forEach [160021, 160022, 160023, 160024, 160025, 160026, 160027];
    // Muzzle velocities
    {ctrlSetText [_x, Str(Round(((GVAR(workingMemory) select 18) select _forEachIndex) select 1))]} forEach [160031, 160032, 160033, 160034, 160035, 160036, 160037];
} else {
    // Temperatures
    {ctrlSetText [_x, Str(Round(((((GVAR(workingMemory) select 18) select _forEachIndex) select 0) * 1.8 + 32) * 10) / 10)]} forEach [160021, 160022, 160023, 160024, 160025, 160026, 160027];
    // Muzzle velocities
    {ctrlSetText [_x, Str(Round((((GVAR(workingMemory) select 18) select _forEachIndex) select 1) * 3.2808399))]} forEach [160031, 160032, 160033, 160034, 160035, 160036, 160037];
};
