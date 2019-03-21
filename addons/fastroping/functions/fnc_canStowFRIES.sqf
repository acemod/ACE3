#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the unit can stow the helicopters FRIES.
 *
 * Arguments:
 * 0: The helicopter itself <OBJECT>
 *
 * Return Value:
 * Able to stow FRIES <BOOL>
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_canStowFRIES
 *
 * Public: No
 */
params ["_vehicle"];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;

(_vehicle getVariable [QGVAR(deploymentStage), 0]) == 2 &&
{getText (_config >> QGVAR(onCut)) != ""}
