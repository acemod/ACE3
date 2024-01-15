#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function checks whether an ammunition type should cause spalling
 *
 *
 * Arguments:
 * 0: _ammo <STRING> - cfgAmmo type of ammo to check
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

private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
private _explosive = getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive");
private _indirectHit = getNumber (configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");

_shouldSpall = _caliber * GVAR(spallIntensity) >= 2.5 || (_explosive >= 0.5 && _explosive * _indirectHit * GVAR(spallIntensity) >= 4);

GVAR(shouldSpallCache) set [_ammo, _shouldSpall];

_shouldSpall