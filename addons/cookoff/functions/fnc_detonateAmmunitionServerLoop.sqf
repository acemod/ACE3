#include "..\script_component.hpp"
/*
 * Author: Glowbal, johnb43
 * Detonates ammunition from an object (e.g. vehicle or crate) until no ammo is left.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Destroy when finished <BOOL>
 * 2: Source <OBJECT>
 * 3: Instigator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true, player, player] call ace_cookoff_fnc_detonateAmmunitionServerLoop
 *
 * Public: No
 */

params ["_object", "_destroyWhenFinished", "_source", "_instigator"];

if (isNull _object) exitWith {};

(_object getVariable QGVAR(cookoffMagazines)) params ["_magazines", "_totalAmmo"];

private _hasFinished = _totalAmmo <= 0 || {_magazines isEqualTo []};

// If the cook-off has finished or been interrupted, clean up the effects for boxes (no vehicle effects)
if (
    _hasFinished ||
    {underwater _object} ||
    {private _posASL = getPosWorld _object; surfaceIsWater _posASL && {(_posASL select 2) < 0}} || // Underwater is not very reliable, so use model center instead
    {GVAR(ammoCookoffDuration) == 0} ||
    {!([GVAR(enableAmmoCookoff), GVAR(enableAmmobox)] select (_object isKindOf "ReammoBox_F"))} ||
    {!(_object getVariable [QGVAR(enableAmmoCookoff), true])}
) exitWith {
    // Box cook-off fire ends after the ammo has detonated (vehicle cook-off fire does not depend on the ammo detonation)
    if (_object isKindOf "ReammoBox_F") then {
        [QGVAR(cleanupEffects), _object] call CBA_fnc_globalEvent;

        // Reset variable, so the box can cook-off again
        _object setVariable [QGVAR(isCookingOff), nil, true];

        // Remove cook-off effects from box
        private _jipID = _object getVariable QGVAR(cookoffBoxJipID);

        if (isNil "_jipID") exitWith {};

        _jipID call CBA_fnc_removeGlobalEventJIP;

        _object setVariable [QGVAR(cookoffBoxJipID), nil];
    };

    // Reset variables, so the object can detonate its ammo again
    _object setVariable [QGVAR(cookoffMagazines), nil];
    _object setVariable [QGVAR(isAmmoDetonating), nil, true];

    // If done, destroy the object if necessary
    if (_hasFinished && _destroyWhenFinished) then {
        _object setDamage [1, true, _source, _instigator];
    };
};

private _magazineIndex = floor random (count _magazines);
private _magazine = _magazines select _magazineIndex;
_magazine params ["_magazineClassname", "_ammoCount", "_spawnProjectile"];

// Make sure ammo is at least 0
_ammoCount = _ammoCount max 0;

// Remove some ammo, which will be detonated
private _removed = _ammoCount min floor (1 + random (6 / GVAR(ammoCookoffDuration)));

_ammoCount = _ammoCount - (_removed * 1.6);

if (_ammoCount <= 0) then {
    _magazines deleteAt _magazineIndex;
} else {
    _magazine set [1, _ammoCount]; // remove ammo that was detonated
};

private _timeBetweenAmmoDetonation = ((random 10 / sqrt _totalAmmo) min MAX_TIME_BETWEEN_AMMO_DET) max 0.1;
TRACE_2("",_totalAmmo,_timeBetweenAmmoDetonation);
_totalAmmo = _totalAmmo - _removed;

_object setVariable [QGVAR(cookoffMagazines), [_magazines, _totalAmmo]];

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
        [QGVAR(playCookoffSound), [_object, _simType]] call CBA_fnc_globalEvent;

        if (random 1 < 0.6) then {
            [_object, _ammo, _speed, true] call _fnc_spawnProjectile;
        };
    };
    case "shotshell": {
        [QGVAR(playCookoffSound), [_object, _simType]] call CBA_fnc_globalEvent;

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
            [QGVAR(playCookoffSound), [_object, _simType]] call CBA_fnc_globalEvent;

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

// Detonate the remaining ammo after a delay
[LINKFUNC(detonateAmmunitionServerLoop), [_object, _destroyWhenFinished, _source, _instigator], _timeBetweenAmmoDetonation] call CBA_fnc_waitAndExecute;