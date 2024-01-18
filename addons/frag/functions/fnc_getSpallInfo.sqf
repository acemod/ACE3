#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function returns spalling parameters for a specific
 * ammo type.
 *
 * Arguments:
 * 0: _ammo <STRING> - CfgAmmo type of ammo to check
 *
 * Return Value:
 * _ammoInfo <ARRAY>
 *  0: _caliber - search range for fragments <NUMBER>
 *  1: _explosive - whether the round is explosive or not <NUMBER>
 *  2: _indirectHitRange - Indirect hit damage <NUMBER>
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_getSpallInfo;
 *
 * Public: No
 */

params ["_ammo"];

private _ammoInfo = GVAR(spallInfoCache) get _ammo;

if (!isNil "_ammoInfo") exitWith {_ammoInfo};

private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
private _caliber = getNumber (_ammoConfig >> "caliber");
private _explosive = 1 min getNumber (_ammoConfig >> "explosive");
private _indirectHit = getNumber (_ammoConfig >> "indirectHitRange");
_ammoInfo = [_caliber, _explosive, _indirectHit];

GVAR(spallInfoCache) set [_ammo, _ammoInfo];

_ammoInfo
