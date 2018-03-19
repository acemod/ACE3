/*
 * Author: TCVM
 * Handles removing ammo from a turret
 * Called from a global event but only runs where turret is local
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Magainze Unit Can Carry <STRING>
 * 3: Magazine To Remove From Static <STRING>
 * 4: Ammo Holder <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0], player, "500Rnd_127x99_mag_Tracer_Green", "ACE_100Rnd_127x99_Green_carryable"] call ace_crewserved_fnc_handleRemoveTurretMag
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_turretPath", "_carryMag", "_vehMag", "_ammoHolder"];

TRACE_6("removeTurretMag EH",_vehicle,_turretPath,_unit,_carryMag,_vehMag);
TRACE_3("",local _vehicle, _vehicle turretLocal _turretPath,local _unit);
if (!(_vehicle turretLocal _turretPath)) exitWith {};

private _ammo = magazinesAmmoFull _vehicle;
private _maxMagazineCapacity = getNumber(configFile >> "CfgMagazines" >> _carryMag >> "count");
private _magazineAmmoCount = (_ammo select 0) select 1;
private _maxAmmo = _magazineAmmoCount min _maxMagazineCapacity;

private _ammoRemoved = (_vehicle magazineTurretAmmo [_vehMag, _turretPath]) - _maxAmmo;

_ammoHolder addMagazineAmmoCargo[_carryMag, 1, _maxAmmo];
_vehicle setAmmo [(_vehicle weaponsTurret _turretPath) select 0, _ammoRemoved];


