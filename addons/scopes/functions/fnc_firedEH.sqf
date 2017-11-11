/*
 * Author: KoffeinFlummi, esteldunedain, Ruthberg
 * Adjusts the flight path of the bullet according to the zeroing. Called from the unified fired EH only for local and non-local players on foot.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_scopes_fnc_firedEH
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

if (!(_ammo isKindOf "BulletBase")) exitWith {};

private _weaponIndex = [_unit, currentWeapon _unit] call EFUNC(common,getWeaponIndex);
if (_weaponIndex < 0) exitWith {};

private _adjustment = ACE_player getVariable [QGVAR(Adjustment), [[0, 0, 0], [0, 0, 0], [0, 0, 0]]];
private _zeroing = +(_adjustment select _weaponIndex);
TRACE_1("Adjusting With",_zeroing);

// Convert zeroing from mils to degrees
_zeroing = _zeroing vectorMultiply MRAD_TO_DEG(1);

if (GVAR(correctZeroing)) then {
    // Override all previously applied corrections
    private _muzzleVelocity = vectorMagnitude (velocity _projectile);
    private _railDirection = _unit weaponDirection _weapon;
    _projectile setVelocity (_railDirection vectorMultiply _muzzleVelocity);
    // Add dispersion (Bivariate normal distribution - calculate variance by solving the Rayleigh CDF for sigma at x ~ 0.6827)
    private _dispersion = SD_TO_MIN_MAX(0.66 * RAD_TO_DEG(getNumber(configFile >> "CfgWeapons" >> _weapon >> "Single" >> "dispersion")) / 2);
    _zeroing = _zeroing vectorAdd [random [-_dispersion, 0, _dispersion], random [-_dispersion, 0, _dispersion], 0];
    // Calculate correct zero angle
    private _advancedBallistics = missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false];
    private _boreHeight = GVAR(boreHeight) select _weaponIndex;
    private _zeroRange = [_unit] call FUNC(getCurrentZeroRange);
    private _zeroAngle = missionNamespace getVariable format[QGVAR(%1_%2_%3_%4_%5_%6), _zeroRange, _boreHeight, _weapon, _ammo, _magazine, _advancedBallistics];
    if (isNil "_zeroCorrection") then {
         _zeroAngle = [_zeroRange, _boreHeight, _weapon, _ammo, _magazine, _advancedBallistics] call FUNC(calculateZeroAngle);
    };
    private _baseAngle = GVAR(baseAngle) select _weaponIndex;
    _zeroing = _zeroing vectorAdd [0, 0, _zeroAngle - _baseAngle];
};

if (_zeroing isEqualTo [0, 0, 0]) exitWith {};

_zeroing params ["_elevation", "_windage", "_zero"];

[_projectile, _windage, _elevation + _zero, 0] call EFUNC(common,changeProjectileDirection);
