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
 * ["B_556x45_Ball"] call ace_medical_engine_fnc_getAmmoData
 *
 * Public: No
 */
// Baseline penetrability used for armor penetration calculation, see (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber)
#define ARMOR_PENETRABILITY 0.015

params ["_ammo"];

private _return = GVAR(ammoCache) get _ammo;
if (isNil "_return") then {
    TRACE_1("Cache miss",_ammo);
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
    private _hit = getNumber (_ammoConfig >> "hit");
    private _caliber = (getNumber (_ammoConfig >> "caliber"));
    private _typicalSpeed = getNumber (_ammoConfig >> "typicalSpeed");
    private _penFactor = _caliber * ARMOR_PENETRABILITY;
    _return = [_hit, _penFactor, _typicalSpeed];
    GVAR(ammoCache) set [_ammo, _return];
};

_return // return
