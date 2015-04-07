/*
 * Author: commy2
 *
 * DESCRIPTION.
 *
 * Arguments:
 * firedBIS
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

private ["_weapon", "_magazine", "_projectile"];

_weapon = _this select 1;
_magazine = _this select 5;
_projectile = _this select 6;

if (getNumber (configFile >> "CfgMagazines" >> _magazine >> QGVAR(forceMagazineMuzzleVelocity)) != 1) exitWith {
    //hint str (speed _projectile / 3.6);
};

private ["_initSpeedWeapon", "_initSpeedMagazine"];

_initSpeedWeapon = getNumber (configFile >> "CfgWeapons" >> _weapon >> "initSpeed");
_initSpeedMagazine = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");

//systemChat format ["W: %1m/s, M: %2m/s", _initSpeedWeapon, _initSpeedMagazine];

// force magazine initSpeed

private ["_credit", "_debit"];

_credit = vectorMagnitude velocity _projectile;
_debit = _credit + (_initSpeedMagazine - _initSpeedWeapon);

_projectile setVelocity ((velocity _projectile) vectorMultiply (_debit / _credit));

//hint str (speed _projectile / 3.6);
