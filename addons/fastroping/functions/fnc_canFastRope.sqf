/*
 * Author: KoffeinFlummi
 *
 * Checks if a unit can fast rope out of his vehicle.
 *
 * Arguments:
 * 0: The unit
 * 1: The vehicle
 *
 * Return Value:
 * Bool
 */

#include "script_component.hpp"

private ["_unit", "_vehicle"];
_unit = _this select 0;
_vehicle = _this select 1;

(_vehicle == vehicle _unit) and
(locked _vehicle <= 1) and
(_vehicle getVariable [QGVAR(ropesDeployed), False]) and
(vectorMagnitude (velocity _vehicle) < 4) and
(count ([_vehicle getVariable [QGVAR(ropesOccupied), []], {!_this}] call EFUNC(common,filter)) > 0)
