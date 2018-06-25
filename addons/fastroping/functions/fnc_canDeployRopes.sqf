#include "script_component.hpp"
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
 * [_player, _vehicle] call ace_fastroping_fnc_canDeployRopes
 *
 * Public: No
 */
params ["_unit", "_vehicle"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _enabled = getNumber (_config >> QGVAR(enabled));
private _deploymentStage = _vehicle getVariable [QGVAR(deploymentStage), 0];

(driver _vehicle != _unit) &&
{getPos _vehicle select 2 > 2} &&
{_enabled == 1 || {_enabled == 2 && {!(isNull (_vehicle getVariable [QGVAR(FRIES), objNull]))}}} &&
{
    (_deploymentStage == 0 && {getText (_config >> QGVAR(onPrepare)) == ""}) ||
    {_deploymentStage == 2 && {getText (_config >> QGVAR(onPrepare)) != ""}}
}
