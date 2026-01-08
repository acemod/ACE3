#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Returns base damage value, penetration factor, and expected muzzle velocity of a given round, either from a cache or by reading the ammo config.
 *
 * Arguments:
 * 0: Ammo <STRING>
 *
 * Return Value:
 * Base damage value, penetration factor, muzzle velocity <ARRAY of NUMBER>
 *
 * Example:
 * "B_556x45_Ball" call ace_medical_damage_fnc_getAmmoData
 *
 * Public: No
 */

// Baseline penetrability used for armor penetration calculation, see (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber)
#define ARMOR_PENETRABILITY 0.015

params ["_ammo"];

GVAR(ammoCache) getOrDefaultCall [toLowerANSI _ammo, {
    TRACE_1("Cache miss",_ammo);
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;

    if (isNull _ammoConfig) then {
        [0, 0, 0] // return
    } else {
        private _hit = getNumber (_ammoConfig >> "hit");
        private _caliber = getNumber (_ammoConfig >> "caliber");
        private _typicalSpeed = getNumber (_ammoConfig >> "typicalSpeed");
        private _penFactor = _caliber * ARMOR_PENETRABILITY;
        [_hit, _penFactor, _typicalSpeed] // return
    };
}, true]
