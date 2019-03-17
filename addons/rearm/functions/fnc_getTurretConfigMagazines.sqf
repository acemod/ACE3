#include "script_component.hpp"
/*
 * Author: GitHawk, Jonpas
 * Returns all magazines a turret of a vehicle object can hold according to config.
 *
 * Arguments:
 * 0: Vehicle object or typeOf <OBJECT><STRING>
 * 1: Turret Path <ARRAY>
 *
 * Return Value:
 * Magazine classes in TurretPath <ARRAY>
 *
 * Example:
 * [vehicle, [0]] call ace_rearm_fnc_getTurretConfigMagazines
 *
 * Public: No
 */

getArray ((_this call CBA_fnc_getTurret) >> "magazines")
