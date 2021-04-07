#include "script_component.hpp"
/*
 * Author: Glowbal
 * Detonates ammunition from a vehicle until no ammo left
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 * 1: Ammo Array <ARRAY>
 *      0: Magazine Classname <STRING>
 *      1: Ammo Count <NUMBER>
 * 2: Total Ammo Count <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, magazinesAmmo _vehicle] call ace_cookoff_fnc_detonateAmmunition
 *
 * Public: No
 */

params ["_vehicle", "_magazines", "_totalAmmo"];

if (GVAR(enable) == 0) exitWith {};
if !(GVAR(enableAmmoCookoff)) exitWith {};

if (isNull _vehicle) exitWith {}; // vehicle got deleted
if (_magazines isEqualTo []) exitWith {}; // nothing to detonate anymore
if (underwater _vehicle) exitWith {};

private _magazineIndex = floor random(count _magazines);
private _magazine = _magazines select _magazineIndex;
_magazine params ["_magazineClassname", "_amountOfMagazines"];

if (_amountOfMagazines > 0) exitWith {
    private _removed = _amountOfMagazines min floor(1 + random(6 / GVAR(ammoCookoffDuration)));

    _amountOfMagazines = _amountOfMagazines - _removed;
    if (_amountOfMagazines <= 0) then {
        _magazines deleteAt _magazineIndex;
    } else {
        _magazine set [1, _amountOfMagazines]; // clear out the magazine
    };
    private _timeBetweenAmmoDetonation = (((random 10) / (sqrt _totalAmmo)) min MAX_TIME_BETWEEN_AMMO_DET) max 0.1;
    TRACE_2("",_totalAmmo,_timeBetweenAmmoDetonation);
    _totalAmmo = _totalAmmo - _removed;

    private _ammo = getText (configFile >> "CfgMagazines" >> _magazineClassname >> "ammo");
    private _ammoCfg = configFile >> "CfgAmmo" >> _ammo;

    private _speedOfAmmo = getNumber (configFile >> "CfgMagazines" >> _magazineClassname >> "initSpeed");
    private _simType = getText (_ammoCfg >> "simulation");

    private _effect2pos = _vehicle selectionPosition "destructionEffect2";

    private _spawnProjectile = {
        params ["_vehicle", "_ammo", "_speed", "_flyAway"];

        private _spawnPos = _vehicle modelToWorld [-0.2 + (random 0.4), -0.2 + (random 0.4), random 3];
        if (_spawnPos select 2 < 0) then {
            _spawnPos set [2, 0];
        };

        private _projectile = createVehicle [_ammo, _spawnPos, [], 0, "CAN_COLLIDE"];
        if (_flyAway) then {
            private _vectorAmmo = [(-1 + (random 2)), (-1 + (random 2)), -0.2 + (random 1)];
            private _velVec = _vectorAmmo vectorMultiply _speed;
            _projectile setVectorDir _velVec;
            _projectile setVelocity _velVec;
        } else {
            _projectile setDamage 1;
        };

        _projectile;
    };

    private _speed = random (_speedOfAmmo / 10) max 1;

    if (toLower _simType == "shotbullet") then {
        private _sound = selectRandom [QUOTE(PATHTO_R(sounds\light_crack_close.wss)), QUOTE(PATHTO_R(sounds\light_crack_close_filtered.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close_filtered.wss))];
        playSound3D [_sound, objNull, false, (getPosASL _vehicle), 2, 1, 1250];

        if (random 1 < 0.6) then {
            [_vehicle, _ammo, _speed, true] call _spawnProjectile;
        };
    };
    if (toLower _simType == "shotshell") then {
        private _sound = selectRandom [QUOTE(PATHTO_R(sounds\heavy_crack_close.wss)), QUOTE(PATHTO_R(sounds\heavy_crack_close_filtered.wss))];
        playSound3D [_sound, objNull, false, (getPosASL _vehicle), 2, 1, 1300];

        if (random 1 < 0.15) then {
            [_vehicle, _ammo, _speed, true] call _spawnProjectile;
        };
    };
    if (toLower _simType == "shotgrenade") then {
        if (random 1 < 0.9) then {
            _speed = 0;
        };
        [_vehicle, _ammo, _speed, random 1 < 0.5] call _spawnProjectile;
    };
    if (toLower _simType in ["shotrocket", "shotmissile", "shotsubmunitions"]) then {
        if (random 1 < 0.1) then {
            private _sound = selectRandom [QUOTE(PATHTO_R(sounds\cannon_crack_close.wss)), QUOTE(PATHTO_R(sounds\cannon_crack_close_filtered.wss))];
            playSound3D [_sound, objNull, false, (getPosASL _vehicle), 3, 1, 1600];

            [_vehicle, _ammo, _speed, random 1 < 0.3] call _spawnProjectile;
        } else {
            createvehicle ["ACE_ammoExplosionLarge", (_vehicle modelToWorld _effect2pos), [], 0 , "CAN_COLLIDE"];
        };
    };
    if (toLower _simType in ["shotdirectionalbomb", "shotmine"]) then {
        if (random 1 < 0.5) then {
            // Not all explosives detonate on destruction, some have scripted alternatives
            private _scripted = getNumber (_ammoCfg >> "triggerWhenDestroyed") == 1;
            if !(_scripted) then {
                _ammo = getText (_ammoCfg >> "ace_explosives_Explosive");
            };

            // If a scripted alternative doesn't exist use generic explosion
            if (_ammo != "") then {
                [_vehicle, _ammo, 0, false] call _spawnProjectile;
            } else {
                createvehicle ["SmallSecondary", (_vehicle modelToWorld _effect2pos), [], 0 , "CAN_COLLIDE"];
            };
        };
    };
    if (toLower _simType == "shotilluminating") then {
        if (random 1 < 0.15) then {
            [_vehicle, _ammo, _speed, random 1 < 0.3] call _spawnProjectile;
        };
    };

    [FUNC(detonateAmmunition), [_vehicle, _magazines, _totalAmmo], _timeBetweenAmmoDetonation] call CBA_fnc_waitAndExecute;
};
ERROR_1("mag with no ammo - %1", _magazine);
