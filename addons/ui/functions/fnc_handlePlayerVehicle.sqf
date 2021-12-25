#include "script_component.hpp"
/*
 * Author: GhostIsSpooky
 * Handles switching units.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: New Vehicle <OBJECT>
 * 2: Old Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, bobtruck, bob] call ace_ui_fnc_handlePlayerVehicle
 *
 * Public: No
 */
params ["_unit", "_oldVeh", "_newVeh"];

if !(GVAR(enableSpeedIndicator)) exitWith {};

private _speedIndicator = uiNamespace getVariable [QGVAR(speedIndicator), controlNull];

_speedIndicator ctrlShow (_newVeh isEqualTo _unit)
