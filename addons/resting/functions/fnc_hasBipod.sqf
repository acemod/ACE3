/*
 * Author: Commy2
 *
 * Check if the weapon has a bipod
 *
 * Arguments:
 * 0: weapon
 *
 * Return Values:
 * Boolean
 *
 */
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_weapon);

private ["_config"];
_config = configFile >> "CfgWeapons" >> _weapon;

getNumber (_config >> "ACE_Bipod") == 1 ||
getNumber (_config >> "AGM_Bipod") == 1 ||
{getNumber (_config >> "tmr_autorest_deployable") == 1}
