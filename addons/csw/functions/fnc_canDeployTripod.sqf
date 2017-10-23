/*
 * Author: TCVM
 * Checks if the player can deploy the tripod.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * [player] call ace_csw_fnc_canDeploy
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

(getText(configFile >> "CfgWeapons" >> (secondaryWeapon _player) >> QGVAR(options) >> "type") == "mount");

