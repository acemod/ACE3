/*
 * Author: KoffeinFlummi
 *
 * Adjusts the direction of a shell.
 *
 * Arguments:
 * -> arguments of the FiredBIS EH
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

private ["_vehicle", "_weapon", "_ammo", "_magazine", "_projectile"];

_vehicle = _this select 0;
_weapon = _this select 1;
_ammo = _this select 4;
_magazine = _this select 5;
_projectile = _this select 6;

private ["_gunner", "_turret"];

_gunner = [_vehicle, _weapon] call EFUNC(common,getGunner);
_turret = [_gunner] call EFUNC(common,getTurretIndex);

if (ACE_player != _gunner) exitWith {};

private ["_FCSMagazines", "_FCSElevation", "_offset"];

_FCSMagazines = _vehicle getVariable format ["%1_%2", QGVAR(Magazines), _turret];
_FCSElevation = _vehicle getVariable format ["%1_%2", QGVAR(Elevation), _turret];

if !(_magazine in _FCSMagazines) exitWith {};

// GET ELEVATION OFFSET OF CURRENT MAGAZINE
_offset = 0;
{
    if (_x == _magazine) exitWith {
        _offset = _FCSElevation select _forEachIndex;
    };
} forEach _FCSMagazines;

[_projectile, (_vehicle getVariable format ["%1_%2", QGVAR(Azimuth), _turret]), _offset, 0] call EFUNC(common,changeProjectileDirection);

// Air burst missile
// may need to get rewritten
if (getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_Airburst") == 1) then {
    _this spawn {
        _vehicle = _this select 0;
        _projectile = _this select 6;

        _distance = _vehicle getVariable [format ["%1_%2", QGVAR(Distance), _turret], currentZeroing _vehicle];

        if (_distance < 50) exitWith {};
        if (_distance > 1500) exitWith {};

        waitUntil {_projectile distance _vehicle > _distance || {!alive _projectile}};
        if (!alive _projectile) exitWith {};

        _position = getPosATL _projectile;

        _subMunition = createVehicle ["ACE_B_35mm_ABM_Helper", _position, [], 0, "FLY"];
        _subMunition setPosATL _position;
        _subMunition setVelocity [0, 0, -10];

        deleteVehicle _projectile;
    };
};
