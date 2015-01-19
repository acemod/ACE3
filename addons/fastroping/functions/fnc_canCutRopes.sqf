/*
 * Author: KoffeinFlummi
 *
 * Checks if the player can cut the ropes of the given vehicle
 *
 * Arguments:
 * 0: Vehicle
 *
 * Return Value:
 * Bool
 */

#include "script_component.hpp"

private ["_vehicle"];
_vehicle = _this select 0;

(_vehicle getVariable [QGVAR(ropesDeployed), False]) and
(count ([_vehicle getVariable [QGVAR(ropesOccupied), []], {_this}] call EFUNC(common,filter)) == 0)
