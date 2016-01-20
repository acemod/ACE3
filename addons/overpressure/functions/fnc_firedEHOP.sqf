/*
 * Author: joko // Jonas
 * Handle fire of Vehicle Weapons
 *
 * Arguments:
 * 0: Vehicle that fired (XEH will filter only local) <OBJECT>
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
 * [tank, "cannon_125mm", "cannon_125mm", "player", "Sh_125mm_APFSDS_T_Green", "24Rnd_125mm_APFSDS_T_Green", projectile] call ace_overpressure_fnc_firedEHOP
 *
 * Public: No
 */
#include "script_component.hpp"

params ["", "_weapon", "", "", "_ammo", "_magazine", ""];

// Bake variable name and check if the variable exists, call the caching function otherwise
private _varName = format [QGVAR(values%1%2%3), _weapon, _ammo, _magazine];
private _damage = if (isNil _varName) then {
    ([_weapon, _ammo, _magazine] call FUNC(cacheOverPressureValues)) select 2;
} else {
    (missionNameSpace getVariable _varName) select 2;
};

if (_damage > 0) then {
    _this call DFUNC(fireOverpressureZone)
};
