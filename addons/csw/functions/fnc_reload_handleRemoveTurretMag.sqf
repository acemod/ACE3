#include "script_component.hpp"
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
 * 4: Unit to unload to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, [0], "ACE_csw_100Rnd_127x99_mag_red", "500Rnd_127x99_mag_Tracer_Green", player] call ace_csw_fnc_reload_handleRemoveTurretMag
 *
 * Public: No
 */

params ["_vehicle", "_turretPath", "_carryMag", "_vehMag", "_unit"];
TRACE_5("removeTurretMag EH",_vehicle,_turretPath,_carryMag,_vehMag,_unit);

TRACE_3("",local _vehicle, _vehicle turretLocal _turretPath,local _unit);
if (!(_vehicle turretLocal _turretPath)) exitWith {};

private _magsInWeapon = [];  // Check how much ammo it has now:
{
    _x params ["_xMag", "_xTurret", "_xAmmo"];
    if ((_xMag == _vehMag) && {_xTurret isEqualTo _turretPath}) then {
        _magsInWeapon pushBack _xAmmo;
    };
} forEach (magazinesAllTurrets _vehicle);
TRACE_1("",_magsInWeapon);

// Remove any empty mags from start:
private _ammoInFirstMag = 0;
while {(!(_magsInWeapon isEqualTo [])) && {_ammoInFirstMag = _magsInWeapon deleteAt 0; (_ammoInFirstMag == 0)}} do {
    TRACE_1("Removing empty mag",_ammoInFirstMag);
    _vehicle removeMagazineTurret [_vehMag, _turretPath];
};
TRACE_2("",_magsInWeapon,_ammoInFirstMag);
if ((_magsInWeapon isEqualTo []) && {_ammoInFirstMag == 0}) exitWith {};

private _maxAmmo = getNumber (configFile >> "CfgMagazines" >> _carryMag >> "count");
private _ammoRemoved = _ammoInFirstMag min _maxAmmo;
private _ammoLeft = _ammoInFirstMag - _ammoRemoved;

if ((_magsInWeapon isEqualTo []) && {_ammoInFirstMag > _ammoRemoved}) then {
    // Only one mag in gun, and we're just taking out a partial ammount (unlinking)
    TRACE_2("Setting mag ammo",_ammoRemoved,_ammoLeft);
    // _vehicle setMagazineTurretAmmo [_vehMag, _ammoLeft, _turretPath];

    // setMagazineTurretAmmo is broken on split locality, use setAmmo for now
    private _weapon = (_vehicle weaponsTurret _turretPath) param [0, ""];
    TRACE_3("setAmmo",_vehicle,_weapon, _ammoLeft);
    _vehicle setAmmo [_weapon, _ammoLeft];
    private _currentAmmo = _vehicle magazineTurretAmmo [_vehMag, _turretPath];
    if ((_weapon == "") || {_currentAmmo != _ammoLeft}) then { ERROR_1("failed to setAmmo - %1", _this); };


} else {
    // Because of command limitations, we need to remove mags to change their ammo
    // This will cause the gun to need to be reloaded if more than one is loaded (only a problem for non-assembly mode guns)
    TRACE_2("Removing magazine",_ammoRemoved,_ammoLeft);
    _vehicle removeMagazinesTurret [_vehMag, _turretPath];
    if (_ammoLeft > 0) then {
        _magsInWeapon pushBack _ammoLeft;
        TRACE_1("Re-adding partial",_ammoLeft);
    };
    {
        if (_x > 0) then { _vehicle addMagazineTurret [_vehMag, _turretPath, _x]; };
    } forEach _magsInWeapon;
};

TRACE_3("Returning ammo",_unit,_carryMag,_ammoRemoved);
[QGVAR(returnAmmo), [_unit, _carryMag, _ammoRemoved], _unit] call CBA_fnc_targetEvent;
