/*
 * Author: TCVM
 * Checks if you can deploy a weapon on the tripod
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Wether or not you can deploy the weapon <BOOL>
 *
 * Example:
 * [player] call ace_csw_fnc_canDeployWeapon
 *
 * Public: No
 */
#include "script_component.hpp"
params["_target", "_player"];

// If the current backpack has a config-value of "ace_csw_assembleTo" that means its a CSW
!(isNull(configfile >> "CfgVehicles" >> (backpack _player) >> QGVAR(cswOptions) >> "ace_csw_assembleTo"))
