#include "script_component.hpp"
/*
 * Author: Salluci
 * Returns base damage value of a given round, either from a cache or by reading the ammo config.
 *
 * Arguments:
 * 0: Ammo <STRING>
 *
 * Return Value:
 * Base damage value and penetration factor of a given round <ARRAY>
 *
 * Example:
 * ["B_556x45_Ball"] call ace_medical_engine_fnc_getAmmoHit
 *
 * Public: No
 */

params ["_ammo"];

private _return = GVAR(ammoCache) get _ammo;
if (isNil "_return") then {
    TRACE_1("Cache miss",_ammo);
    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
    _hit = getNumber (_ammoConfig >> "hit");
    _caliber = getNumber (_ammoConfig >> "caliber");
    _return = [_hit, _caliber];
    GVAR(ammoCache) set [_ammo, _return];
};

_return // return
