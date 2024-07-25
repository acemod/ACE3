#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if you can deploy a weapon on the tripod
 *
 * Arguments:
 * 0: Target Tripod <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Wether or not you can deploy the weapon <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_assemble_canDeployWeapon
 *
 * Public: No
 */

params ["_target", "_player"];

// If the current launcher has a config-value that defines the tripod, it is a CSW
(alive _target) &&
{(getText (configFile >> "CfgWeapons" >> secondaryWeapon _player >> QUOTE(ADDON) >> "assembleTo" >> typeOf _target)) != ""}
