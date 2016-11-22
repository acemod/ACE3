/*
 * Author: PabstMirror
 * Handles removing magazines from a turret (removes as many as the unit can carry)
 * Called from a global event but only runs where turret is local
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Turret Path <ARRAY>
 * 2: Unit doing action <OBJECT>
 * 3: Magazine To Remove From Static <STRING>
 * 4: Magainze Unit Can Carry <STRING>
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

params ["_vehicle", "_turretPath", "_unit", "_carryMag", "_vehMag"];
TRACE_5("removeTurretMag EH",_vehicle,_turretPath,_unit,_carryMag,_vehMag);

TRACE_3("",local _vehicle, _vehicle turretLocal _turretPath,local _unit);
if (!(_vehicle turretLocal _turretPath)) exitWith {};

private _ammoRemoved = [];  // Check how much ammo it has now:
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if ((_xMag == _vehMag) && {_xTurret isEqualTo _turretPath} && {_xAmmo > 0}) then {
        _ammoRemoved pushBack _xAmmo;
    };
} forEach (magazinesAllTurrets _vehicle);

// Remove All Mags:
_vehicle removeMagazinesTurret [_vehMag, _turretPath];

private _maxAmmo = getNumber (configFile >> "CfgMagazines" >> _carryMag >> "count");

// Add what we can to unit
while {(_unit canAdd _carryMag) && {!(_ammoRemoved isEqualTo [])}} do {
    private _ammoFromVeh = _ammoRemoved select 0;
    private _ammoToUnit = _ammoFromVeh min _maxAmmo;
    
    _unit addMagazine [_carryMag, _ammoToUnit]; // Add to unit (safe if unit is non-local)
    
    _ammoFromVeh = _ammoFromVeh - _ammoToUnit;
    if (_ammoFromVeh == 0) then {
        _ammoRemoved deleteAt 0; // We removed an entire mag from the vehicle
    } else {
        _ammoRemoved set [0, _ammoFromVeh]; // We could only remove part of a mag
    };
    TRACE_1("adding to unit",_ammoFromVeh);
};

// Re-add remaining back to turret
{
    TRACE_1("adding back to veh",_x);
    _vehicle addMagazineTurret [_vehMag, _turretPath, _x];
} forEach _ammoRemoved;
