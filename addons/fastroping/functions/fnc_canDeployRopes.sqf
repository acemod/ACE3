/*
 * Author: KoffeinFlummi
 *
 * Checks if the player can deploy ropes.
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

(locked _vehicle <= 1) and
!(_vehicle getVariable [QGVAR(ropesDeployed), False]) and
(getPos _vehicle select 2) > 5 and
(getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(enabled))) == 1
