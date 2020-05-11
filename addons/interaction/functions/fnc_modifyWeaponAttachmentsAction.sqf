#include "script_component.hpp"
/*
 * Author: Dystopian
 * Modifies Weapon Attachments action icon depending on current weapon type.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player (not used) <OBJECT>
 * 2: Args (not used) <Any>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player, [], []] call ace_interaction_fnc_modifyWeaponAttachmentsAction
 *
 * Public: No
 */

params ["_target", "", "", "_actionData"];

private _filename = ["", "primaryWeapon", "secondaryWeapon", "handgun"] select 1+([_target, currentWeapon _target] call DEFUNC(common,getWeaponIndex));    

_actionData set [2, format ["%1\%2_ca.paa", WEAPON_ICON_PATH, _filename]];
