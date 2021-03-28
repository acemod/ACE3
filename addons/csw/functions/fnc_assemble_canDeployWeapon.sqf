#include "script_component.hpp"
/*
 * Author: TCVM
 * Checks if you can deploy a weapon on the tripod
 *
 * Arguments:
 * 0: Target Tripod <OBJECT>
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Wether or not you can deploy the weapon <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_assemble_canDeployWeapon
 *
 * Public: No
 */

params ["_target", "_player", "", "_carryWeaponClassname"];
if (isNil "_carryWeaponClassname") then { _carryWeaponClassname = secondaryWeapon _player };

// If the current launcher has a config-value that defines the tripod, it is a CSW
(alive _target) &&
{(getText(configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "assembleTo" >> (typeOf _target))) != ""}

