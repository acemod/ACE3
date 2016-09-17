/*
 * Author: Glowbal
 * Detonates ammunition from a vehicle until no ammo left
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, magazinesAmmo _vehicle] call ace_cookoff_fnc_detonateAmmunition
 *
 * Public: No
 */
#include "script_component.hpp"
#define MAX_TIME_BETWEEN_AMMO_DET 25

params ["_vehicle", "_magazines"];

if (isNull _vehicle) exitWith {}; // vehicle got deleted
if (_magazines isEqualTo []) exitWith {}; // nothing to detonate anymore

private _magazineIndex = floor random(count _magazines);
private _magazine = _magazines select _magazineIndex;
_magazine params ["_magazineClassname", "_amountOfMagazines"];

if (_amountOfMagazines > 0) exitWith {
    private _newMagCount = _amountOfMagazines - floor(1 + random(6));
    if (_newMagCount <= 0) then {
        _magazines deleteAt _magazineIndex;
    } else {
        _magazine set [1, _newMagCount]; // clear out the magazine
    };
    private _ammo = getText(configFile >> "CfgMagazines" >> _magazineClassname >> "ammo");

    private _timeBetweenAmmoDetonation = (random 7) * (1 / random (_amountOfMagazines)) min MAX_TIME_BETWEEN_AMMO_DET;
    _timeBetweenAmmoDetonation = _timeBetweenAmmoDetonation max 0.1;

    private _speedOfAmmo = getNumber (configFile >> "CfgMagazines" >> _magazineClassname >> "initSpeed");
    private _simulationTime = getNumber (configFile >> "CfgAmmo" >> _ammo >> "simulation");
    private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
    private _simType = getText(configFile >> "CfgAmmo" >> _ammo >> "simulation");

    private _effect2pos = _vehicle selectionposition "destructionEffect2";

    private _spawnProjectile = {
        params ["_vehicle", "_ammo", "_speed", "_flyAway"];

        private _spawnPos = _vehicle modelToWorld [-0.2 + (random 0.4), -0.2 + (random 0.4), random 3];
        if (_spawnPos select 2 < 0) then {
            _spawnPos set [2, 0];
        };
        private _projectile = _ammo createVehicle [0,0,0];
        _projectile setPos _spawnPos;
        if (_flyAway) then {
            private _vectorAmmo = [(-1 + (random 2)), (-1 + (random 2)), -0.2 + (random 1)];
            private _velVec = _vectorAmmo apply {_x * _speed};
            _projectile setVectorDir _velVec;
            _projectile setVelocity _velVec;
            [ACE_player, _projectile, [1,0,0,1]] call EFUNC(frag,addTrack);
        } else {
            _projectile setDamage 1;
        };

        _projectile;
    };

    private _speed = random (_speedOfAmmo / 10) max 1;

    if (toLower _simType == "shotbullet") then {
        private _sound = selectRandom [QUOTE(PATHTO_R(sounds\light_crack_close.wss)), QUOTE(PATHTO_R(sounds\light_crack_close_filtered.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close_filtered.wss))];
        playSound3D [_sound, objNull, false, (getPosASL _vehicle), 2, 1, 1250];

        if (random(1) >= 0.4) then {
            [_vehicle, _ammo, _speed, true] call _spawnProjectile;
        };
    };
    if (toLower _simType == "shotshell") then {
        private _sound = selectRandom [QUOTE(PATHTO_R(sounds\heavy_crack_close.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close_filtered.wss))];
        playSound3D [_sound, objNull, false, (getPosASL _vehicle), 2, 1, 1300];

        [_vehicle, _ammo, _speed, random 1 < 0.15] call _spawnProjectile;
    };
    if (toLower _simType == "shotgrenade") then {
        private _sound = selectRandom [QUOTE(PATHTO_R(sounds\heavy_crack_close.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close_filtered.wss)), QUOTE(PATHTO_R(sounds\cannon_crack_close.wss)), QUOTE(PATHTO_R(sounds\cannon_crack_close_filtered.wss))];
        playSound3D [_sound, objNull, false, (getPosASL _vehicle), 2.5, 1, 1450];

        [_vehicle, _ammo, _speed, random 1 < 0.5] call _spawnProjectile;
    };
    if (toLower _simType == "shotrocket" || {toLower _simType == "shotmissile"}) then {
        if (random(1) >= 0.9) then {
            private _sound = selectRandom [QUOTE(PATHTO_R(sounds\cannon_crack_close.wss)), QUOTE(PATHTO_R(sounds\cannon_crack_close_filtered.wss))];
            playSound3D [_sound, objNull, false, (getPosASL _vehicle), 3, 1, 1600];

            [_vehicle, _ammo, _speed, random 1 < 0.3] call _spawnProjectile;
        } else {
            "ACE_ammoExplosionLarge" createvehicle (_vehicle modelToWorld _effect2pos);
        };
    };
    if (toLower _simType in ["shotdirectionalbomb", "shotilluminating", "shotmine"]) then {
        if (random(1) >= 0.5) then {
            [_vehicle, _ammo, 0, false] call _spawnProjectile;
        };
    };

    [FUNC(detonateAmmunition), [_vehicle, _magazines], _timeBetweenAmmoDetonation] call CBA_fnc_waitAndExecute;
};
[FUNC(detonateAmmunition), [_vehicle, _magazines], random 3] call CBA_fnc_waitAndExecute;
