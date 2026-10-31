#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns base damage value, penetration multiplier, expected muzzle velocity and explosive fraction
 * of a given round, either from a cache or by reading the ammo config.
 *
 * Arguments:
 * 0: Ammo <STRING>
 *
 * Return Value:
 * 0: Base damage value <NUMBER>
 * 1: Penetration factor, mm RHA per m/s (caliber * penetrability) <NUMBER>
 * 2: Muzzle velocity <NUMBER>
 * 3: Fraction of damage that is explosive rather than kinetic, 0..1 <NUMBER>
 *
 * Example:
 * "B_556x45_Ball" call ace_medical_damage_fnc_getAmmoData
 *
 * Public: No
 */

// Penetration depth in mm is velocity * caliber * penetrability / 1000, RHA penetrability is 15
// ref https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber
#define ARMOR_PENETRABILITY 0.015

params ["_ammo"];

GVAR(ammoCache) getOrDefaultCall [toLowerANSI _ammo, {
    TRACE_1("Cache miss",_ammo);
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;

    if (isNull _ammoConfig) then {
        [0, 0, 0, 0] // return
    } else {
        private _hit = getNumber (_ammoConfig >> "hit");
        private _penFactor = getNumber (_ammoConfig >> "caliber") * ARMOR_PENETRABILITY;
        private _typicalSpeed = getNumber (_ammoConfig >> "typicalSpeed");
        // Some vanilla ammo goes above 1 (B_20mm is 1.8), clamp so callers can rely on the range
        private _explosive = 0 max getNumber (_ammoConfig >> "explosive") min 1;
        [_hit, _penFactor, _typicalSpeed, _explosive] // return
    };
}, true]
