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

params ["_vehicle", "_turret", "_vehMag", "_ammo", ["_newMagazineParams", []]];
TRACE_4("addTurretMag EH",_vehicle,_turret,_vehMag,_ammo);

TRACE_2("mag params", (count _newMagazineParams) > 0, _newMagazineParams);

if ((count _newMagazineParams) > 0) then {
    _newMagazineParams params["_loadedMagazine"];
    _vehicle removeMagazineTurret[_loadedMagazine, _turret];
    _vehicle addMagazineTurret[_vehMag, _turret, 1];
    _vehicle setAmmo [(_vehicle weaponsTurret _turret) select 0, 0];
};

private _maxAmmo = _vehicle currentMagazineDetailTurret _turret;
TRACE_1("turret details", magazinesAllTurrets _vehicle);
private _magazineAmmoCount = _ammo;

private _wantedAmmo = ((_vehicle magazineTurretAmmo [_vehMag, _turret]) + _magazineAmmoCount);

// due to an issue with locality, I set the ammo locally so the person who deployed the weapon sees the same result. It does NOT duplicate ammo
_vehicle setAmmo [(_vehicle weaponsTurret _turret) select 0, _wantedAmmo];

TRACE_4("",local _vehicle, _vehicle turretLocal _turret, (_vehicle weaponsTurret _turret) select 0, _wantedAmmo);
if (!(_vehicle turretLocal _turret)) exitWith {};

TRACE_1("added",_vehicle magazinesTurret _turret);

