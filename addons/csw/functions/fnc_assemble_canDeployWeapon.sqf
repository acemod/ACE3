#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Checks if you can deploy a weapon on the tripod.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY> (default: secondaryWeapon _player)
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
{(getText (configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "assembleTo" >> (typeOf _target))) != ""}
