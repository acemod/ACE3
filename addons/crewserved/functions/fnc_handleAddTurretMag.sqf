/*
 * Author: PabstMirror
 * Handles adding a magazine to a turret 
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

TRACE_2("",local _vehicle, _vehicle turretLocal _turret);
if (!(_vehicle turretLocal _turret)) exitWith {};

_vehicle addMagazineTurret [_vehMag, _turret, _ammo];
TRACE_1("added",_vehicle magazinesTurret _turret);
