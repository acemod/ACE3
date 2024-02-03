#include "..\script_component.hpp"
/*
 * Author: Glowbal, johnb43
 * Detonates ammunition from an object (e.g. vehicle or crate) until no ammo is left.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Destroy when finished <BOOL> (default: false)
 * 2: Killer <OBJECT> (default: objNull)
 * 3: Instigator <OBJECT> (default: objNull)
 * 4: Initial delay <NUMBER> (default: 0)
 *
 * Return Value:
 * Nothing Useful
 *
 * Example:
 * [cursorObject] call ace_cookoff_fnc_detonateAmmunition
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_object", ["_destroyWhenFinished", false], ["_killer", objNull], ["_instigator", objNull], ["_initialDelay", 0]];

if (isNull _object) exitWith {};

private _vehicleAmmo = _object getVariable QGVAR(cookoffMagazines);

if (isNil "_vehicleAmmo") then {
    _vehicleAmmo = _object call FUNC(getVehicleAmmo);

    _object setVariable [QGVAR(cookoffMagazines), _vehicleAmmo];

    // TODO: When setMagazineTurretAmmo and magazineTurretAmmo are fixed (https://feedback.bistudio.com/T79689),
    // we can add gradual ammo removal during cook-off
    if (GVAR(removeAmmoDuringCookoff)) then {
        clearMagazineCargoGlobal _object;

        {
            _object removeMagazinesTurret [_x select 0, _x select 1];
        } forEach (magazinesAllTurrets _object);
    };
};

_vehicleAmmo params ["_magazines", "_totalAmmo"];

// If the cook-off has finished, clean up the effects and destroy the object
if (_magazines isEqualTo [] || {_totalAmmo <= 0}) exitWith {
    [QGVAR(cleanupEffects), _object] call CBA_fnc_globalEvent;

    _object setVariable [QGVAR(cookoffMagazines), nil];

    if (_destroyWhenFinished) then {
        _object setDamage [1, true, _killer, _instigator];
    };
};

// If the cook-off is interrupted or disabled, clean up the effects
if (underwater _object || {
    if (GVAR(ammoCookoffDuration) == 0) exitWith {true};

    if (_object isKindOf "ReammoBox_F") exitWith {
        !(GVAR(enableAmmobox) && {_object getVariable [QGVAR(enableAmmoCookoff), true]})
    };

    !(GVAR(enableAmmoCookoff) && {_object getVariable [QGVAR(enableAmmoCookoff), true]})
}) exitWith {
    [QGVAR(cleanupEffects), _object] call CBA_fnc_globalEvent;

    _object setVariable [QGVAR(cookoffMagazines), nil];
};

// Initial delay allows for a delay for the first time this function runs in its cycle
if (_initialDelay > 0) exitWith {
    [FUNC(detonateAmmunition), [_object, _destroyWhenFinished, _killer, _instigator], _initialDelay] call CBA_fnc_waitAndExecute;
};

private _magazineIndex = floor random (count _magazines);
private _magazine = _magazines select _magazineIndex;
_magazine params ["_magazineClassname", "_ammoCount", "_spawnProjectile"];

// Make sure ammo is at least 0
_ammoCount = _ammoCount max 0;

// Remove some ammo, which will be detonated
private _removed = _ammoCount min floor (1 + random (6 / GVAR(ammoCookoffDuration)));

_ammoCount = _ammoCount - _removed;

if (_ammoCount <= 0) then {
    _magazines deleteAt _magazineIndex;
} else {
    _magazine set [1, _ammoCount]; // remove ammo that was detonated
};

private _timeBetweenAmmoDetonation = ((random 10 / sqrt _totalAmmo) min MAX_TIME_BETWEEN_AMMO_DET) max 0.1;
TRACE_2("",_totalAmmo,_timeBetweenAmmoDetonation);
_totalAmmo = _totalAmmo - _removed;

_object setVariable [QGVAR(cookoffMagazines), [_magazines, _totalAmmo]];

// Detonate the remaining ammo after a delay
[FUNC(detonateAmmunition), [_object, _destroyWhenFinished, _killer, _instigator], _timeBetweenAmmoDetonation] call CBA_fnc_waitAndExecute;

// Get magazine info, which is used to spawn projectiles
private _configMagazine = configFile >> "CfgMagazines" >> _magazineClassname;
private _ammo = getText (_configMagazine >> "ammo");
private _configAmmo = configFile >> "CfgAmmo" >> _ammo;

private _simType = toLower getText (_configAmmo >> "simulation");
private _speed = linearConversion [0, 1, random 1, 1, 20, true];
private _effect2pos = _object selectionPosition "destructionEffect2";

// Spawns the projectiles, making them either fly in random directions or explode
private _fnc_spawnProjectile = {
    // If the magazines are inside of the cargo (inventory), don't let their projectiles escape the interior of the vehicle
    if (!_spawnProjectile) exitWith {};

    params ["_object", "_ammo", "_speed", "_flyAway"];

    private _spawnPos = _object modelToWorld [-0.2 + random 0.4, -0.2 + random 0.4, random 3];

    if (_spawnPos select 2 < 0) then {
        _spawnPos set [2, 0];
    };

    private _projectile = createVehicle [_ammo, _spawnPos, [], 0, "CAN_COLLIDE"];

    if (_flyAway) then {
        private _vectorAmmo = [-1 + random 2, -1 + random 2, -0.2 + random 1];
        private _vectorVelocity = _vectorAmmo vectorMultiply _speed;

        _projectile setVectorDir _vectorVelocity;
        _projectile setVelocity _vectorVelocity;
    } else {
        _projectile setDamage 1;
    };
};

switch (_simType) do {
    case "shotbullet": {
        private _sound = selectRandom [QPATHTO_R(sounds\light_crack_close.wss), QPATHTO_R(sounds\light_crack_close_filtered.wss), QPATHTO_R(sounds\heavy_crack_close.wss), QPATHTO_R(sounds\heavy_crack_close_filtered.wss)];
        playSound3D [_sound, objNull, false, getPosASL _object, 2, 1, 1250];

        if (random 1 < 0.6) then {
            [_object, _ammo, _speed, true] call _fnc_spawnProjectile;
        };
    };
    case "shotshell": {
        private _sound = selectRandom [QPATHTO_R(sounds\heavy_crack_close.wss), QPATHTO_R(sounds\heavy_crack_close_filtered.wss)];
        playSound3D [_sound, objNull, false, getPosASL _object, 2, 1, 1300];

        if (random 1 < 0.15) then {
            [_object, _ammo, _speed, true] call _fnc_spawnProjectile;
        };
    };
    case "shotgrenade": {
        if (random 1 < 0.9) then {
            _speed = 0;
        };

        [_object, _ammo, _speed, random 1 < 0.5] call _fnc_spawnProjectile;
    };
    case "shotrocket";
    case "shotmissile";
    case "shotsubmunitions": {
        if (random 1 < 0.1) then {
            private _sound = selectRandom [QPATHTO_R(sounds\cannon_crack_close.wss), QPATHTO_R(sounds\cannon_crack_close_filtered.wss)];
            playSound3D [_sound, objNull, false, getPosASL _object, 3, 1, 1600];

            [_object, _ammo, _speed, random 1 < 0.3] call _fnc_spawnProjectile;
        } else {
            createVehicle ["ACE_ammoExplosionLarge", _object modelToWorld _effect2pos, [], 0 , "CAN_COLLIDE"];
        };
    };
    case "shotdirectionalbomb";
    case "shotmine": {
        if (random 1 < 0.5) then {
            // Not all explosives detonate on destruction, some have scripted alternatives
            if (getNumber (_configAmmo >> "triggerWhenDestroyed") != 1) then {
                _ammo = getText (_configAmmo >> QEGVAR(explosives,explosive));
            };

            // If a scripted alternative doesn't exist use generic explosion
            if (_ammo != "") then {
                [_object, _ammo, 0, false] call _fnc_spawnProjectile;
            } else {
                createVehicle ["SmallSecondary", _object modelToWorld _effect2pos, [], 0 , "CAN_COLLIDE"];
            };
        };
    };
    case "shotilluminating": {
        if (random 1 < 0.15) then {
            [_object, _ammo, _speed, random 1 < 0.3] call _fnc_spawnProjectile;
        };
    };
};
