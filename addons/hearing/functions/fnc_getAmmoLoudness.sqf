#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, johnb43
 * Get the loudness of ammo.
 * Because `initSpeed` is a magazine attribute however, the magazine name is used instead of the ammo.
 *
 * Arguments:
 * 0: Magazine <STRING>
 * 1: Ammo <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["30Rnd_65x39_caseless_mag", "B_65x39_Caseless"] call ace_hearing_fnc_getAmmoLoudness
 *
 * Public: No
 */

params ["_magazine", "_ammo"];

GVAR(cacheAmmoLoudness) getOrDefaultCall [_magazine, {
    private _cfgAmmo = configFile >> "CfgAmmo";
    private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
    private _ammoConfig = _cfgAmmo >> _ammo;
    private _caliber = getNumber (_ammoConfig >> "ACE_caliber");

    _caliber = switch (true) do {
        // If explicilty defined, use ACE_caliber
        case (inheritsFrom (_ammoConfig >> "ACE_caliber") isEqualTo _ammoConfig): {_caliber};
        case (_ammo isKindOf ["ShellBase", _cfgAmmo]): {80};
        case (_ammo isKindOf ["RocketBase", _cfgAmmo]): {200};
        case (_ammo isKindOf ["MissileBase", _cfgAmmo]): {600};
        case (_ammo isKindOf ["SubmunitionBase", _cfgAmmo]): {80};
        default {[_caliber, 6.5] select (_caliber <= 0)};
    };

    private _loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) / 5;
    TRACE_5("building cache",_ammo,_magazine,_initSpeed,_caliber,_loudness);

    _loudness
}, true];
