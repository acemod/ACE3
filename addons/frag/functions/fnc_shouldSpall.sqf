#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should cause spalling.
 *
 * Arguments:
 * 0: Ammo classname <STRING>
 *
 * Return Value:
 * Whether the round type would spall when hitting an object <BOOL>
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_shouldSpall;
 *
 * Public: No
 */

params ["_ammo"];

private _shouldSpall = GVAR(shouldSpallCache) get _ammo;

if (!isNil "_shouldSpall") exitWith {_shouldSpall};

private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
private _caliber = getNumber (_ammoConfig >> "caliber");
private _explosive = 1 min getNumber (_ammoConfig >> "explosive");
private _indirectHit = getNumber (_ammoConfig >> "indirectHitRange");

// We need get this for fnc_getSpallInfo, so might as well cache it since we have it
GVAR(spallInfoCache) set [_ammo, [_caliber, _explosive, _indirectHit]];

_shouldSpall = _caliber * GVAR(spallIntensity) >= 1.25 * ACE_FRAG_SPALL_POWER_MIN || (_explosive >= 0.5 && {_indirectHit * GVAR(spallIntensity) >= 2 * ACE_FRAG_SPALL_POWER_MIN});

GVAR(shouldSpallCache) set [_ammo, _shouldSpall];

_shouldSpall
