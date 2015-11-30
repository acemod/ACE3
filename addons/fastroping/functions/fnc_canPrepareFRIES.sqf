/*
 * Author: BaerMitUmlaut
 * Checks if the unit can prepare the helicopters FRIES.
 *
 * Arguments:
 * 0: Unit occupying the helicopter <OBJECT>
 * 1: The helicopter itself <OBJECT>
 *
 * Return Value:
 * Able to prepare FRIES <BOOL>
 *
 * Example:
 * [_player, _vehicle] call ace_fastroping_canPrepareFRIES
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_unit", "_vehicle"];
private ["_deployedRopes", "_config"];

_deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

(isNumber (_config >> QGVAR(enabled)) &&
{(getNumber (_config >> QGVAR(enabled)) == 1) || {!(isNull (_vehicle getVariable [QGVAR(FRIES), objNull]))}} &&
{(_vehicle getVariable [QGVAR(deploymentStage), 0]) == 0})
