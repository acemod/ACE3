#include "script_component.hpp"
/*
 * Author: commy2, johnb43
 * Reload a launcher
 * If the ammo argument is nil, a full magazine will be given.
 *
 * Arguments:
 * 0: Unit to do the reloading <OBJECT>
 * 1: Target to rload <OBJECT>
 * 2: weapon name <STRING>
 * 3: missile name <STRING>
 * 4: Ammo count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin, "weapon", "missile"] call ace_reloadlaunchers_fnc_reloadLauncher
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine", "_ammo"];
TRACE_5("params",_unit,_target,_weapon,_magazine,_ammo);

private _checkSelectedWeapon = isPlayer _target || {!isNull (_target getVariable ["bis_fnc_moduleRemoteControl_owner", objNull])};

// AI don't select launchers with selectWeapon/switchWeapon
if (_checkSelectedWeapon) then {
    _target selectWeapon _weapon;
};

// Check if the launcher has been selected (but only for players and remote controlled AI) and hadn't been reloaded
if ((_checkSelectedWeapon && {currentWeapon _target != _weapon}) || {currentMagazine _target != ""}) exitWith {
    // If failed, readd magazine back to reloading unit
    [_unit, _magazine, _ammo, true] call CBA_fnc_addMagazine;

    // Notify reloading unit about failure
    [QEGVAR(common,displayTextStructured), [LELSTRING(common,ActionAborted)], _unit] call CBA_fnc_targetEvent;
};

// Add magazine to launcher immediately
_target addWeaponItem [_weapon, [_magazine, _ammo], true];

// Notify reloading unit about success
[QEGVAR(common,displayTextStructured), [LLSTRING(LauncherLoaded)], _unit] call CBA_fnc_targetEvent;
