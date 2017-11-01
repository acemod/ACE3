/*
 * Author: BaerMitUmlaut
 * Checks if the player can close the ramp of the given helo.
 *
 * Arguments:
 * 0: The helicopter <OBJECT>
 * 1: The ramp animation name <STRING>
 * 2: Turret paths that can close the ramp <ARRAY>
 *
 * Return Value:
 * Able to close ramp <BOOL>
 *
 * Example:
 * [_vehicle, _door, _turretPaths] call ace_fastroping_fnc_canCloseRamp
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle", "_door", "_turretPaths"];

(_vehicle doorPhase _door > 0.5) &&
{alive _vehicle} &&
{(_vehicle getVariable ["bis_disabled_Ramp", 0]) != 1} &&
{!(_vehicle getVariable [QGVAR(doorsLocked), false])} &&
{
    (ACE_player == driver _vehicle) ||
    {((assignedVehicleRole ACE_player) param [1, []]) in _turretPaths}
}
