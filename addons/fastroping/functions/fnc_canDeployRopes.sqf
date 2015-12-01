/*
 * Author: BaerMitUmlaut
 * Checks if the unit can deploy ropes from the helicopter.
 *
 * Arguments:
 * 0: Unit occupying the helicopter <OBJECT>
 * 1: The helicopter itself <OBJECT>
 *
 * Return Value:
 * Able to deploy ropes <BOOL>
 *
 * Example:
 * [_player, _vehicle] call ace_fastroping_canDeployRopes
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_unit", "_vehicle"];

private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];

((driver _vehicle != _unit) &&
{(_vehicle getVariable [QGVAR(deploymentStage), 0]) == 2} &&
{getPos _vehicle select 2 > 2})
