/*
 * Author: joko // Jonas
 * Handle fire of local launchers
 *
 * Arguments:
 * 0: Unit that fired <OBJECT>
 * 1: Weapon fired <STRING>
 * 2: Muzzle <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 *
 * Example: 
 * [player, "launch_RPG32_F", "launch_RPG32_F", "Single", "R_PG32V_F", "RPG32_F", projectile] call ace_overpressure_fnc_firedEHBB;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_firer", "_weapon", "", "", "_ammo", "_magazine", ""];

// Prevent AI from causing backblast damage (fast exit to only run for local players)
if (_firer != ACE_player) exitWith {};

// Bake variable name and check if the variable exists, call the caching function otherwise
private _varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
private _damage = if (isNil _varName) then {
    ([_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues)) select 2;
} else {
    (missionNameSpace getVariable _varName) select 2;
};

if (_damage > 0) then {
    _this call DFUNC(fireLauncherBackblast)
};
