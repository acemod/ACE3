#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the unit can fast rope from the helicopter.
 *
 * Arguments:
 * 0: Unit occupying the helicopter <OBJECT>
 * 1: The helicopter itself <OBJECT>
 *
 * Return Value:
 * Able to fast ropes <BOOL>
 *
 * Example:
 * [_player, _vehicle] call ace_fastroping_fnc_canFastRope
 *
 * Public: No
 */
params ["_unit", "_vehicle"];

private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];

((driver _vehicle != _unit) &&
{!(_deployedRopes isEqualTo [])} &&
{{!(_x select 5) && !(_x select 6)} count (_deployedRopes) > 0} &&
{getPos _vehicle select 2 > 2})
