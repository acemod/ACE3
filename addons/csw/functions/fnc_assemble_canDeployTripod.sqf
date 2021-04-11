#include "script_component.hpp"
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
 * [player] call ace_csw_fnc_assemble_canDeployTripod
 *
 * Public: No
 */

params ["_player"];

(getText(configFile >> "CfgWeapons" >> (secondaryWeapon _player) >> QUOTE(ADDON) >> "type") == "mount")

