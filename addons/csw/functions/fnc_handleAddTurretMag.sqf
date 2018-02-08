/*
 * Author: TCVM
 * Handles adding ammo to a turret 
 * Called from a global event but only runs where turret is local
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Unit doing action <OBJECT>
 * 3: Vehicle Magazine <STRING>
 * 4: Ammo in magazine <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0], player, "200Rnd_127x99_mag_Tracer_Red", 70] call ace_crewserved_fnc_canLoadMagazine
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_turret", "_vehMag", "_ammo"];
TRACE_4("addTurretMag EH",_vehicle,_turret,_vehMag,_ammo);

private _maxAmmo = _vehicle currentMagazineDetailTurret _turret;
private _magazineAmmoCount = _ammo;

private _wantedAmmo = ((_vehicle magazineTurretAmmo [_vehMag, _turret]) + _magazineAmmoCount);
// due to an issue with locality, I set the ammo locally so the person who deployed the weapon sees the same result. It does NOT duplicate ammo
_vehicle setAmmo [_vehicle currentWeaponTurret _turret, _wantedAmmo];

TRACE_2("",local _vehicle, _vehicle turretLocal _turret);
if (!(_vehicle turretLocal _turret)) exitWith {};

TRACE_1("added",_vehicle magazinesTurret _turret);
