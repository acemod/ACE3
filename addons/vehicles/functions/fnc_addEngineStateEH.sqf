#include "script_component.hpp"
/*
 * Author: brainslush
 * Add eventhandlers to update the latest engine state of the vehicle
 *
 * Arguments:
 * 0: Vehcile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car] call ace_vehicles_fnc_addEngineStateEH.sqf
 *
 * Public: No
 */

params ["_vehicle"];

_vehicle setVariable [QGVAR(engineState), isEngineOn _vehicle];
_vehicle addEventHandler [
	"engine",
	{(_this select 0) setVariable [QGVAR(engineState), _this select 1]}
];
