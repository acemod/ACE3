#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Determines if you can pick-up the Dragon missile. If the missile was fired you will not be able to pick up the tripod.
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
 */
params ["_target", "_unit"];
!(_target getVariable [QGVAR(fired), false]) && { [_target, _unit] call EFUNC(csw,assemble_canPickupTripod) }

