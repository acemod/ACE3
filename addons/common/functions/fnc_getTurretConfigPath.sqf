#include "..\script_component.hpp"
/*
 * Author: commy2
 * Get the config path of a vehicles turret.
 *
 * Arguments:
 * 0: Vehicle Config <CONFIG>
 * 1: Turret indecies <ARRAY>
 *
 * Return Value:
 * Turret config <CONFIG>
 *
 * Example:
 * [CfgVehicle, [Array]] call ace_common_fnc_getTurretConfigPath
 *
 * Public: Yes
 */

call CBA_fnc_getTurret
