#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Modifies interaction for deploying weapon
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, [], []] call ace_csw_fnc_assemble_deployWeaponModifier
 *
 * Public: No
 */

params ["_target", "_player", "", "_actionData"];

private _carryWeaponClassname = secondaryWeapon _player;
private _assembleTo = (getText(configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "assembleTo" >> (typeOf _target)));
private _icon = getText (configFile >> "CfgVehicles" >> _assembleTo >> "picture");
TRACE_2("",_assembleTo,_icon);

_actionData set [2, _icon];
