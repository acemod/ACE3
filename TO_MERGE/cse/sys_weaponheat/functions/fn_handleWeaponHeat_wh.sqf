/**
 * fn_handleWeaponHeat_wh.sqf
 * @Descr: Is expected to be triggered by the fired eventhandler from BI.
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 *
 * Params:
 *   1. unit: Object - Object the event handler is assigned to
 *   2. weapon: String - Fired weapon
 *   3. muzzle: String - Muzzle that was used
 *   4. mode: String - Current mode of the fired weapon
 *   5. ammo: String - Ammo used
 *   6. magazine: String - magazine name which was used
 *   7. projectile: Object - Object of the projectile that was shot (Arma 2: OA and onwards)
 */

#include "defines.h"

private ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_bullet", "_barrelTemperature", "_muzzleVelocity", "_barrelMass", "_bulletMass", "_caliber", "_kineticEnergy"];
_unit     = _this select 0;
_weapon   = _this select 1;
_muzzle   = _this select 2;
_mode     = _this select 3;
_ammo     = _this select 4;
_magazine = _this select 5;
_bullet   = _this select 6;

if (!(isPlayer _unit) || !local _unit) exitWith {};
if (!(_bullet isKindOf "BulletBase")) exitWith {};

_barrelTemperature = [_unit, _weapon, _muzzle, _ammo] call cse_fnc_getBarrelTemperature_wh;

_muzzleVelocity = getNumber(configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
_barrelMass = [_unit, _weapon, _muzzle] call cse_fnc_getBarrelMass_wh;
_bulletMass = _ammo call cse_fnc_getBulletMass_wh;

_kineticEnergy = 0.5 * (_bulletMass / 1000) * _muzzleVelocity^2; // in J

if (_kineticEnergy > 0 && _barrelMass > 0) then {
	_barrelTemperature = _barrelTemperature + _kineticEnergy / (HEAT_CAPACITY_STEEL * _barrelMass);
	[_unit, _weapon, _muzzle, _barrelTemperature] call cse_fnc_setBarrelTemperature_wh;
};

[_unit, _weapon, _muzzle, _barrelTemperature] call cse_fnc_generateMalfunctions_wh;
[_unit, _weapon, _muzzle, _ammo, _barrelTemperature] call cse_fnc_generateHeatHaze_wh;
[_unit, _weapon, _muzzle, _bullet, _barrelTemperature] call cse_fnc_generateSmoke_wh;

// TODO: High barrel temperature side effects
// cooking off?
// fire (particle effects)?
// glowing barrel at very high temperatures?