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

// If the variable is set, it won't remove magazines
private _objectAmmo = _object getVariable QGVAR(cookoffMagazines);
private _removeAmmoDuringCookoff = isNil "_objectAmmo";

if (_removeAmmoDuringCookoff) then {
    _objectAmmo = [_object, true] call FUNC(getVehicleAmmo);
};

_objectAmmo params ["_magazines", "_totalAmmo"];

private _hasFinished = _totalAmmo <= 0 || {_magazines isEqualTo []};

// If the cook-off has finished or been interrupted, clean up the effects for boxes (no vehicle effects)
if (
    _hasFinished ||
    {underwater _object} ||
    {private _posASL = getPosWorld _object; surfaceIsWater _posASL && {(_posASL select 2) < 0}} || // Underwater is not very reliable, so use model center instead
    {GVAR(ammoCookoffDuration) == 0} ||
    {!([GVAR(enableAmmoCookoff), GVAR(enableAmmobox)] select (_object isKindOf "ReammoBox_F"))} ||
    {!(_object getVariable [QGVAR(enableAmmoCookoff), true])} ||
    {_object getVariable [QGVAR(interruptAmmoCookoff), false]} // QGVAR(interruptAmmoCookoff) stops the current cook-off (allowing future ones), whereas QGVAR(enableAmmoCookoff) disables it entirely
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
    _object setVariable [QGVAR(virtualMagazines), nil];
    _object setVariable [QGVAR(interruptAmmoCookoff), nil, true];
    _object setVariable [QGVAR(isAmmoDetonating), nil, true];

    // If done, destroy the object if necessary
    if (_hasFinished && _destroyWhenFinished) then {
        _object setDamage [1, true, _source, _instigator];
    };
};

private _magazineIndex = floor random (count _magazines);
private _magazine = _magazines select _magazineIndex;
_magazine params ["_magazineClassname", "_ammoCount", "_spawnProjectile", "_magazineInfo"];

// Make sure ammo is at least 0
_ammoCount = _ammoCount max 0;

// Remove some ammo, which will be detonated
private _removed = _ammoCount min floor (1 + random (6 / GVAR(ammoCookoffDuration)));
private _newAmmoCount = _ammoCount - _removed;

// Remove ammo from magazines if enabled
if (_removeAmmoDuringCookoff) then {
    switch (true) do {
        // Turret magazines
        case (_magazineInfo isEqualType []): {
            // The chosen magazine is not guaranteed to the be one selected by setMagazineTurretAmmo, so get the current ammo count first
            _newAmmoCount = ((_object magazineTurretAmmo [_magazineClassname, _magazineInfo]) - _removed) max 0;

            // Remove loaded magazine
            if (_newAmmoCount <= 0) then {
                [QEGVAR(common,removeMagazineTurret), [_object, _magazineClassname, _magazineInfo], _object, _magazineInfo] call CBA_fnc_turretEvent;
            } else {
                [QEGVAR(common,setMagazineTurretAmmo), [_object, _magazineClassname, _newAmmoCount, _magazineInfo], _object, _magazineInfo] call CBA_fnc_turretEvent;
            };
        };
        // Inventory magazines
        case (_magazineInfo isEqualTo false): {
            if (!alive _object) exitWith {
                TRACE_1("clearing cargo mags from dead object",alive _object);
                clearMagazineCargoGlobal _object;
            };
            // Remove selected magazine
            _object addMagazineAmmoCargo [_magazineClassname, -1, _ammoCount];

            // Add a new one with reduced ammo back
            if (_newAmmoCount > 0) then {
                _object addMagazineAmmoCargo [_magazineClassname, 1, _newAmmoCount];
            };
        };
        // Virtual magazines
        case (_magazineInfo isEqualTo true): {
            // Find the virtual magazines and update its count
            private _virtualAmmo = _object getVariable [QGVAR(virtualMagazines), []];
            _magazineIndex = _virtualAmmo findIf {(_x select 0) == _magazineClassname};

            if (_magazineIndex == -1) exitWith {
                TRACE_1("no virtual magazine",_magazineClassname);
            };

            if (_newAmmoCount <= 0) then {
                _virtualAmmo deleteAt _magazineIndex;
            } else {
                (_virtualAmmo select _magazineIndex) set [1, _newAmmoCount]; // Remove ammo that was detonated
            };
        };
    };
} else {
    if (_newAmmoCount <= 0) then {
        _magazines deleteAt _magazineIndex;
    } else {
        _magazine set [1, _newAmmoCount]; // Remove ammo that was detonated
    };
};

private _timeBetweenAmmoDetonation = ((random 10 / sqrt _totalAmmo) min MAX_TIME_BETWEEN_AMMO_DET) max 0.1;
TRACE_2("",_totalAmmo,_timeBetweenAmmoDetonation);

// Update total ammo value if mags aren't being removed (if they are, an updated total will be gotten upon the next ammo detonation iteration)
if (!_removeAmmoDuringCookoff) then {
    _objectAmmo set [1, _totalAmmo - _removed];
};

// Get magazine info, which is used to spawn projectiles
private _configMagazine = configFile >> "CfgMagazines" >> _magazineClassname;
private _ammo = getText (_configMagazine >> "ammo");
private _configAmmo = configFile >> "CfgAmmo" >> _ammo;

private _simType = toLowerANSI getText (_configAmmo >> "simulation");
private _speed = linearConversion [0, 1, random 1, 1, 20, true];
private _effect2pos = _object selectionPosition "destructionEffect2";

// Spawns the projectiles, making them either fly in random directions or explode
private _fnc_spawnProjectile = {
    // If the magazines are inside of the cargo (inventory), don't let their projectiles escape the interior of the vehicle
    if (!_spawnProjectile) exitWith {};

    params ["_flyAway"];

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
        triggerAmmo _projectile;
    };
};

switch (_simType) do {
    case "shotbullet": {
        [QGVAR(playCookoffSound), [_object, _simType]] call CBA_fnc_globalEvent;

        if (random 1 < 0.6) then {
            true call _fnc_spawnProjectile;
        };
    };
    case "shotshell": {
        [QGVAR(playCookoffSound), [_object, _simType]] call CBA_fnc_globalEvent;

        if (random 1 < 0.15) then {
            true call _fnc_spawnProjectile;
        };
    };
    case "shotgrenade": {
        if (random 1 < 0.9) then {
            _speed = 0;
        };

        (random 1 < 0.5) call _fnc_spawnProjectile;
    };
    case "shotrocket";
    case "shotmissile";
    case "shotsubmunitions": {
        if (random 1 < 0.1) then {
            [QGVAR(playCookoffSound), [_object, _simType]] call CBA_fnc_globalEvent;

            (random 1 < 0.3) call _fnc_spawnProjectile;
        } else {
            createVehicle ["ACE_ammoExplosionLarge", _object modelToWorld _effect2pos, [], 0 , "CAN_COLLIDE"];
        };
    };
    case "shotdirectionalbomb";
    case "shotmine": {
        if (random 1 < 0.5) then {
            // _speed should be 0, but as it doesn't fly away, no need to set _speed
            false call _fnc_spawnProjectile;
        };
    };
    case "shotilluminating": {
        if (random 1 < 0.15) then {
            (random 1 < 0.3) call _fnc_spawnProjectile;
        };
    };
};

// Detonate the remaining ammo after a delay
[LINKFUNC(detonateAmmunitionServerLoop), [_object, _destroyWhenFinished, _source, _instigator], _timeBetweenAmmoDetonation] call CBA_fnc_waitAndExecute;
