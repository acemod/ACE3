#include "script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Adjusts the direction of a shell. Called from the unified fired EH only if the gunner is a player.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_fcs_fnc_firedEH
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

private _FCSMagazines = _vehicle getVariable [format ["%1_%2", QGVAR(Magazines), _turret], []];

if !(_magazine in _FCSMagazines) exitWith {};

private _FCSInitSpeed = _vehicle getVariable format ["%1_%2", QGVAR(InitSpeed), _turret];
private _FCSElevation = _vehicle getVariable format ["%1_%2", QGVAR(Elevation), _turret];

// GET ELEVATION OFFSET AND INITSPEED OF CURRENT MAGAZINE
private _offset = 0;
private _initSpeed = 0;
{
    if (_x == _magazine) exitWith {
        _offset = _FCSElevation select _forEachIndex;
        _initSpeed = _FCSInitSpeed select _forEachIndex;
    };
} forEach _FCSMagazines;

// Calculate the correction due to vanilla zeroing
private _zeroDistance = currentZeroing _gunner;
if (_zeroDistance > 0) then {
    private _weaponCombo = [_weapon, _magazine, _ammo, _zeroDistance];
    if !(_weaponCombo isEqualTo (_gunner getVariable [QGVAR(lastWeaponCombo), []])) then {
        private _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
        private _antiOffset = "ace_fcs" callExtension format ["%1,%2,%3,%4", _initSpeed, _airFriction, 0, _zeroDistance];
        _antiOffset = parseNumber _antiOffset;

        _gunner setVariable [QGVAR(lastWeaponCombo), _weaponCombo];
        _gunner setVariable [QGVAR(lastAntiOffset), _antiOffset];
    };
    private _antiOffset = _gunner getVariable QGVAR(lastAntiOffset);

    _offset = _offset - _antiOffset;
    TRACE_4("fired",_gunner, currentZeroing _gunner, _antiOffset, _offset);
};

[_projectile, (_vehicle getVariable format ["%1_%2", QGVAR(Azimuth), _turret]), _offset, 0] call EFUNC(common,changeProjectileDirection);

// Remove the platform velocity
if (vectorMagnitude velocity _vehicle > 2) then {
    private _sumVelocity = (velocity _projectile) vectorDiff (velocity _vehicle);

    _projectile setVelocity _sumVelocity;
};

// Air burst missile
// handle locally only
if (!local _gunner) exitWith {};

if (getNumber (configFile >> "CfgAmmo" >> _ammo >> QGVAR(Airburst)) == 1) then {
    private _zeroing = _vehicle getVariable [format ["%1_%2", QGVAR(Distance), _turret], currentZeroing _gunner];

    if (_zeroing < 50) exitWith {};
    if (_zeroing > 1500) exitWith {};

    [FUNC(handleAirBurstAmmunitionPFH), 0, [_vehicle, _projectile, _zeroing]] call CBA_fnc_addPerFrameHandler;
};
