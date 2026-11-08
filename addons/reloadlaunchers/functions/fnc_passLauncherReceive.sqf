#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Event handler for receiving launcher
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Weapon Array (from getUnitLoadout) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, getUnitLoadout player # 1] call ace_reloadlaunchers_fnc_passLauncherReceive
 *
 * Public: No
 */

params ["_target", "_array"];
TRACE_2("params",_target,_array);

// adapted from ace_gunbag_fnc_toGunbagCallback/offGunbagCallback
private _magazines = _array select [4, 2];
_array deleteRange [4, 2];
private _weapon = _array deleteAt 0;

[_target, _weapon, true, _magazines] call EFUNC(common,addWeapon);
// Add attachments
{
    _target addWeaponItem [_weapon, _x, true];
} forEach (_array select {_x != ""});
