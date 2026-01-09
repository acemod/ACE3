#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, johnb43
 * Get the loudness of ammo.
 * However, because `initSpeed` is a magazine attribute, the magazine name needs to be used instead of the ammo.
 *
 * Arguments:
 * 0: Magazine <STRING>
 *
 * Return Value:
 * <NUMBER>
 *
 * Example:
 * "30Rnd_65x39_caseless_mag" call ace_hearing_fnc_getAmmoLoudness
 *
 * Public: No
 */

params ["_magazine"];

GVAR(cacheAmmoLoudness) getOrDefaultCall [_magazine, {
    private _magazineConfig = configFile >> "CfgMagazines" >> _magazine;
    private _ammo = getText (_magazineConfig >> "ammo");
    private _initSpeed = getNumber (_magazineConfig >> "initSpeed");

    private _cfgAmmo = configFile >> "CfgAmmo";
    private _ammoConfig = _cfgAmmo >> _ammo;
    private _caliber = getNumber (_ammoConfig >> "ACE_caliber");

    _caliber = switch (true) do {
        // If explicitly defined, use ACE_caliber
        case (inheritsFrom (_ammoConfig >> "ACE_caliber") isEqualTo _ammoConfig): {_caliber};
        case (_ammo isKindOf ["ShellBase", _cfgAmmo]): {80};
        case (_ammo isKindOf ["RocketBase", _cfgAmmo]): {200};
        case (_ammo isKindOf ["MissileBase", _cfgAmmo]): {600};
        case (_ammo isKindOf ["SubmunitionBase", _cfgAmmo]): {80};
        default {[_caliber, 6.5] select (_caliber <= 0)};
    };

    private _hearingDamageFactor = [_ammoConfig >> QGVAR(hearingDamageFactor), "NUMBER", 1] call CBA_fnc_getConfigEntry;
    private _loudness = _hearingDamageFactor * (_caliber ^ 1.25 / 10) * (_initSpeed / 1000) / 5;
    
    // Limit to max magazine loudness, if explicitly defined
    private _cfgMaxMagazineLoudness = _magazineConfig >> QGVAR(maxLoudness);
    if (isNumber _cfgMaxMagazineLoudness) then {
        _loudness = _loudness min (getNumber _cfgMaxMagazineLoudness);
    };

    TRACE_6("building cache",_ammo,_magazine,_initSpeed,_caliber,_hearingDamageFactor,_loudness);

    _loudness
}, true]
