#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43, drofseh
 * Reload a launcher for the unit who has the launcher.
 * If the ammo argument is nil, a full magazine will be given.
 *
 * Arguments:
 * 0: Unit executing the reload <OBJECT>
 * 1: Unit equipped with the launcher <OBJECT>
 * 2: Launcher name <STRING>
 * 3: Missile name <STRING>
 * 4: Ammo count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, "launch_RPG32_F", "RPG32_F"] call ace_reloadlaunchers_fnc_reloadLauncher
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine", "_ammo"];
TRACE_5("params",_unit,_target,_weapon,_magazine,_ammo);

// Add magazine to launcher immediately
_target addWeaponItem [_weapon, [_magazine, _ammo], true];

// Don't show notification if target is local AI
if (GVAR(displayStatusText) && {!local _unit} && {_target call EFUNC(common,isPlayer)}) then {
    [LSTRING(LauncherLoaded)] call EFUNC(common,displayTextStructured);
};
