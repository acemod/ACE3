#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Determines if you can attach the sighting unit to the Dragon missile.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit Performing Action <OBJECT>
 *
 * Return Value:
 * Can Pickup Tripod <BOOL>
 *
 * Example:
 * [vehicle player, player] call ace_dragon_fnc_canPickupTripod;
 *
 * Public: No
 *
 */
params ["_target", "_unit"];
!(_target getVariable [QGVAR(fired), false]) && { [_target, _unit, binocular _unit] call EFUNC(csw,assemble_canDeployWeapon) };

