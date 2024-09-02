#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Modifies interaction for deploying weapon.
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

private _tripodClassname = typeOf _target;
private _assembledClassname = getText (configFile >> "CfgWeapons" >> secondaryWeapon _player >> QUOTE(ADDON) >> "assembleTo" >> _tripodClassname);

if (_assembledClassname == "") then {
    _assembledClassname = getText (configFile >> "CfgWeapons" >> primaryWeapon _player >> QUOTE(ADDON) >> "assembleTo" >> _tripodClassname);
};

private _icon = getText (configFile >> "CfgVehicles" >> _assembledClassname >> "picture");
TRACE_2("",_assembledClassname,_icon);

_actionData set [2, _icon];
