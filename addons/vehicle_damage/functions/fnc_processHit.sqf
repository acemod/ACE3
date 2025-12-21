#include "..\script_component.hpp"
/*
 * Author: tcvm, johnb43
 * Process hit by projectile against vehicle and apply appropiate damage to part.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hit point <STRING>
 * 2: Hit index <NUMBER>
 * 3: Added damage to part <NUMBER>
 * 4: Projectile <STRING>
 * 5: Source of damage <OBJECT>
 * 6: Person who caused damage <OBJECT>
 *
 * Return Value:
 * Whether or not to continue handling last frame's damage <BOOL>
 *
 * Example:
 * [cursorObject, "HitEngine", 1, 0.25, projectile, player, player] call ace_vehicle_damage_fnc_processHit
 *
 * Public: No
 */

params ["_vehicle", "_hitPoint", "_hitIndex", "_addedDamage", "_projectile", "_source", "_instigator"];
TRACE_7("processHit",_vehicle,_hitPoint,_hitIndex,_addedDamage,_projectile,_source,_instigator);

_addedDamage = abs _addedDamage;

private _currentPartDamage = _vehicle getHitIndex _hitIndex;
private _newPartDamage = _currentPartDamage + _addedDamage;

// Damage is high enough for immediate destruction
if (_addedDamage >= 15) exitWith {
    TRACE_2("immediate destruction - high damage",_addedDamage,_currentPartDamage);

    // Kill everyone inside for very insane damage
    {
        [QGVAR(medicalDamage), [_x, _source, _instigator, true], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);

    // setDamage triggers "Killed" EH in cookoff, which starts ammo cook-off
    [QGVAR(setDamage), [_vehicle, [1, true, _source, _instigator]]] call CBA_fnc_serverEvent;

    false
};

private _projectileConfig = _projectile call CBA_fnc_getObjectConfig;

private _warheadTypeStr = toLowerANSI getText (_projectileConfig >> "warheadName");
private _warheadType = ["he", "ap", "heat", "tandemheat"] find _warheadTypeStr; // numerical index for warhead type for quicker checks. Numbers defined in script_macros.hpp

private _incendiary = [_projectileConfig >> QGVAR(incendiary), "NUMBER", [0.3, 0.1, 1, 1, 0] select _warheadType] call CBA_fnc_getConfigEntry;

private _hitPointHash = GVAR(vehicleClassesHitPointHash) getOrDefault [typeOf _vehicle, createHashMap];
(_hitPointHash getOrDefault [_hitPoint, []]) params ["_hitArea", "_minDamage"];

private _projectileExplosive = getNumber (_projectileConfig >> "explosive");
private _indirectHit = getNumber (_projectileConfig >> "indirectHit");

if (_warheadType == WARHEAD_TYPE_AP) then {
    // Change damage based on projectile speed (doesn't do this in vanilla Arma believe it or not)
    if (!isNull _source && !("penetrator" in toLowerANSI _projectile)) then {
        private _typicalSpeed = 100 max (getNumber (_projectileConfig >> "typicalSpeed"));
        private _airFriction = getNumber (_projectileConfig >> "airFriction");
        private _distance = _source distance _vehicle;
        private _tofCoef = _airFriction * _distance / _typicalSpeed;
        // Modified logistics map upper bound for v(n) = v(n-1) + dt * airFriction * v(n-1)^2
        // Using estimated speed / typical speed for damage mod
        private _damageMod = 1 / ((-_airFriction) ^ _tofCoef - _typicalSpeed * _tofCoef);
        _addedDamage = (1 - _projectileExplosive) * _addedDamage * _damageMod;
    };
};

private _penChance = 1;

// Added damage can't be 0, so don't need to worry about 0 division here
if (_addedDamage < _minDamage) then {
    _penChance = _addedDamage / _minDamage;

    TRACE_5("minimum damage modifying hit",_addedDamage,_penChance,_minDamage,_warheadTypeStr,_hitArea);
};

if (_penChance < random 1) exitWith {
    TRACE_1("didn't penetrate",_penChance);

    true
};

if (_minDamage == 0) then {
    _minDamage = 1;
};

if (_warheadType == WARHEAD_TYPE_HE) then {
    private _modifiedIndirectHit = _indirectHit / 100;

    if (_addedDamage > _modifiedIndirectHit) then {
        _addedDamage = _addedDamage / 2;
    };

    _addedDamage = (_addedDamage * (_addedDamage / _modifiedIndirectHit)) min _addedDamage;
};

private _ammoEffectiveness = if (_warheadType == WARHEAD_TYPE_AP) then {
    0.15 max _addedDamage
} else {
    if (_warheadType == WARHEAD_TYPE_HE) then {
        (_addedDamage / (_minDamage + (_indirectHit / 100)) * 0.2)
    } else {
        ((_addedDamage / _minDamage) * 0.4) min 1
    };
};

TRACE_4("ammo effectiveness",_ammoEffectiveness,_addedDamage,_minDamage,_warheadTypeStr);

_incendiary = _incendiary * _ammoEffectiveness;

private _isCar = _vehicle isKindOf "Car" && {!(_vehicle isKindOf "Wheeled_APC_F" || _vehicle isKindOf "gm_wheeled_APC_base")};

if (_isCar) then {
    _ammoEffectiveness = (_ammoEffectiveness * 1.5) min 1;
};

(_vehicle call EFUNC(cookoff,getVehicleAmmo)) params ["_magazines", "_totalAmmo"];
private _chanceOfDetonation = 0;
private _explosiveAmmoCount = 0;

if (_magazines isNotEqualTo []) then {
    private _magConfig = configFile >> "CfgMagazines";
    private _ammoConfig = configFile >> "CfgAmmo";
    private _countOfExplodableAmmo = 0;

    {
        _x params ["_magazineClassname", "_currentAmmoCount"];

        private _initialAmmoCount = getNumber (_magConfig >> _magazineClassname >> "count");
        _chanceOfDetonation = _chanceOfDetonation + (_currentAmmoCount / _initialAmmoCount);
        _countOfExplodableAmmo = _countOfExplodableAmmo + 1;

        private _ammoClassname = getText (_magConfig >> _magazineClassname >> "ammo");
        private _explosive = getNumber (_ammoConfig >> _ammoClassname >> "explosive");
        private _hit = getNumber (_ammoConfig >> _ammoClassname >> "hit");

        if (_explosive > 0.5 || {_hit > 50}) then {
            _explosiveAmmoCount = _explosiveAmmoCount + 1;
        };
    } forEach _magazines;

    if (_countOfExplodableAmmo != 0) then {
        _chanceOfDetonation = _chanceOfDetonation / _countOfExplodableAmmo;
    };
};

private _return = true;

switch (_hitArea) do {
    case "engine": {
        private _vehicleConfig = configOf _vehicle;
        private _currentFuel = fuel _vehicle;
        private _chanceToDetonate = getNumber (_vehicleConfig >> QGVAR(engineDetonationProb)) * _incendiary * _currentFuel * _penChance;

        TRACE_4("hit engine",_chanceToDetonate,_incendiary,_chanceOfDetonation,_currentFuel);

        // Knock out and detonate vehicle if necessary
        if ([_vehicle, _chanceToDetonate, _explosiveAmmoCount > 0, _totalAmmo > 0, _source, _instigator] call FUNC(handleDetonation)) exitWith {};

        // Cap damage at 0.9 to avoid hard coded blow up
        _newPartDamage = 0.9 min _newPartDamage;

        // Fatal engine/drive system damage (engine and tracks stop working at 0.9)
        if (0.8 * _ammoEffectiveness > random 1) then {
            _newPartDamage = 0.9;
        };

        if (_newPartDamage == 0.9) then {
            _vehicle setVariable [QGVAR(canMove), false];
        };

        [_vehicle, _hitPoint, _hitIndex, _newPartDamage * _penChance, _source, _instigator] call FUNC(setDamage);

        // No cookoff for cars
        if (_isCar) exitWith {};

        private _chanceOfFire = getNumber (_vehicleConfig >> QGVAR(engineFireProb)) * _incendiary * _currentFuel * _penChance;
        private _cookoffIntensity = 4 * _currentFuel;

        [_vehicle, _chanceOfFire, _cookoffIntensity, _source, _instigator, "engine", false, false] call FUNC(handleCookoff);
    };
    case "hull": {
        private _vehicleConfig = configOf _vehicle;
        private _currentFuel = fuel _vehicle;
        private _chanceToDetonate = getNumber (_vehicleConfig >> QGVAR(hullDetonationProb)) * _incendiary * ((_chanceOfDetonation + _currentFuel) / 2) * _penChance;

        TRACE_4("hit hull",_chanceToDetonate,_incendiary,_chanceOfDetonation,_currentFuel);

        // Knock out and detonate vehicle if necessary
        if ([_vehicle, _chanceToDetonate, _explosiveAmmoCount > 0, _totalAmmo > 0, _source, _instigator] call FUNC(handleDetonation)) exitWith {
            [_vehicle, _hitPoint, _hitIndex, 0.89 * _penChance, _source, _instigator] call FUNC(setDamage);
        };

        // 25% chance of jamming turret - 25% of mobility kill - 25% of both - 75% chance of critical hull damage
        private _rand = random 1;

        TRACE_2("rolling hull damage",_ammoEffectiveness,_rand);

        private _partKill = [];

        if (_ammoEffectiveness > _rand) then {
            _rand = random 1;

            TRACE_2("damaged hull part",_ammoEffectiveness,_rand);

            switch (true) do {
                case (_rand < 0.25): {
                    [_vehicle, _hitPoint, _hitIndex, 0.89 * _penChance, _source, _instigator] call FUNC(setDamage);

                    // Iterate through all keys and find appropriate turret
                    {
                        if ((_y select 0) == "turret") then {
                            _partKill pushBack _x;
                        };
                    } forEach _hitPointHash;

                    _vehicle setVariable [QGVAR(canShoot), false];
                };
                case (_rand < 0.5): {
                    [_vehicle, _hitPoint, _hitIndex, 0.89 * _penChance, _source, _instigator] call FUNC(setDamage);

                    _partKill append (ENGINE_HITPOINTS select 0);

                    if !(_vehicle isKindOf "Wheeled_APC_F") then {
                        _partKill append (TRACK_HITPOINTS select 0);
                    };

                    _vehicle setVariable [QGVAR(canMove), false];
                };
                case (_rand < 0.75): {
                    [_vehicle, _hitPoint, _hitIndex, 0.89 * _penChance, _source, _instigator] call FUNC(setDamage);

                    _partKill append (ENGINE_HITPOINTS select 0);

                    if !(_vehicle isKindOf "Wheeled_APC_F") then {
                        _partKill append (TRACK_HITPOINTS select 0);
                    };

                    // Iterate through all keys and find appropriate turret
                    {
                        if ((_y select 0) == "turret") then {
                            _partKill pushBack _x;
                        };
                    } forEach _hitPointHash;

                    _vehicle setVariable [QGVAR(canMove), false];
                    _vehicle setVariable [QGVAR(canShoot), false];
                };
            };
        };

        {
            [_vehicle, _x, -1, _penChance, _source, _instigator] call FUNC(setDamage);

            TRACE_1("doing damage to hitpoint",_x);
        } forEach _partKill;

        // No cookoff for cars
        if (_isCar) exitWith {};

        private _chanceOfFire = getNumber (_vehicleConfig >> QGVAR(hullFireProb)) * _incendiary * ((_chanceOfDetonation + _currentFuel) / 2) * _penChance;
        private _cookoffIntensity = 1.5 + (_explosiveAmmoCount * _chanceOfFire);

        [_vehicle, _chanceOfFire, _cookoffIntensity, _source, _instigator] call FUNC(handleCookoff);
    };
    case "turret": {
        private _vehicleConfig = configOf _vehicle;
        private _chanceToDetonate = getNumber (_vehicleConfig >> QGVAR(turretDetonationProb)) * _incendiary * _chanceOfDetonation * _penChance;

        TRACE_3("hit turret",_chanceToDetonate,_incendiary,_chanceOfDetonation);

        if ([_vehicle, _chanceToDetonate, _explosiveAmmoCount > 0, _totalAmmo > 0, _source, _instigator] call FUNC(handleDetonation)) exitWith {};

        if (0.8 * _ammoEffectiveness > random 1) then {
            TRACE_1("damaged turret",_ammoEffectiveness * 0.8);

            [_vehicle, _hitPoint, _hitIndex, _penChance, _source, _instigator] call FUNC(setDamage);

            _vehicle setVariable [QGVAR(canShoot), false];
        };

        // No cookoff for cars
        if (_isCar) exitWith {};

        private _chanceOfFire = getNumber (_vehicleConfig >> QGVAR(turretFireProb)) * _incendiary * _chanceOfDetonation * _penChance;
        private _cookoffIntensity = _explosiveAmmoCount * _chanceOfFire;

        [_vehicle, _chanceOfFire, _cookoffIntensity, _source, _instigator] call FUNC(handleCookoff);
    };
    case "gun": {
        TRACE_2("hit gun",_addedDamage,_minDamage);

        if (0.8 * _ammoEffectiveness > random 1) then {
            TRACE_1("damaged gun",_ammoEffectiveness * 0.8);

            [_vehicle, _hitPoint, _hitIndex, _penChance, _source, _instigator] call FUNC(setDamage);

            _vehicle setVariable [QGVAR(canShoot), false];
        };
    };
    case "track": {
        private _damage = (0.1 max (0.1 * _addedDamage / _minDamage)) min 1;

        [_vehicle, _hitPoint, _hitIndex, (_currentPartDamage + _damage) * _penChance, _source, _instigator] call FUNC(setDamage);

        TRACE_3("damaged track",_damage,_addedDamage,_minDamage);

        if ((_vehicle getHitIndex _hitIndex) >= 1) then {
            _vehicle setVariable [QGVAR(canMove), false];
        };
    };
    case "wheel": {
        [_vehicle, _hitPoint, _hitIndex, (_currentPartDamage + _addedDamage) * _penChance, _source, _instigator] call FUNC(setDamage);

        TRACE_1("damaged wheel",_addedDamage);
    };
    case "fuel": {
        private _damage = (0.1 max (0.1 * _addedDamage / _minDamage)) min 1;
        [_vehicle, _hitPoint, _hitIndex, (_currentPartDamage + _damage) * _penChance, _source, _instigator] call FUNC(setDamage);

        // No cookoff for cars
        if (_isCar) exitWith {};

        private _currentFuel = fuel _vehicle;
        private _chanceOfFire = (_incendiary * _currentFuel * _penChance) / 2;
        private _cookoffIntensity = _currentFuel * 5;

        TRACE_4("damaged fuel",_chanceOfFire,_incendiary,_cookoffIntensity,_currentFuel);

        [_vehicle, _chanceOfFire, _cookoffIntensity, _source, _instigator, "", false, false] call FUNC(handleCookoff);
    };
    case "slat": {
        TRACE_2("hit slat",_warheadType,_warheadTypeStr);

        // Incredibly small chance of AP destroying SLAT
        if (_warheadType in [WARHEAD_TYPE_HE, WARHEAD_TYPE_AP, WARHEAD_TYPE_HEAT, WARHEAD_TYPE_TANDEM] || {0.01 > random 1}) then {
            private _currentDamage = _vehicle getHitIndex _hitIndex;

            TRACE_3("damaged slat",_warheadType,_warheadTypeStr,_currentDamage);

            if (_warheadType in [WARHEAD_TYPE_HEAT, WARHEAD_TYPE_TANDEM, WARHEAD_TYPE_AP]) then {
                [_vehicle, _hitPoint, _hitIndex, 1, _source, _instigator] call FUNC(setDamage);
            } else {
                [_vehicle, _hitPoint, _hitIndex, _currentDamage + (0.5 max random 1), _source, _instigator] call FUNC(setDamage);
            };

            if (_currentDamage < 1 && {_warheadType == WARHEAD_TYPE_HEAT}) then {
                _return = false;
            };
        };
    };
    case "era": {
        TRACE_2("hit era",_warheadType,_warheadTypeStr);

        if (_warheadType in [WARHEAD_TYPE_AP, WARHEAD_TYPE_HEAT, WARHEAD_TYPE_TANDEM] || {0.05 > random 1}) then {
            private _currentDamage = _vehicle getHitIndex _hitIndex;

            TRACE_3("damaged era",_warheadType,_warheadTypeStr,_currentDamage);

            [_vehicle, _hitPoint, _hitIndex, 1, _source, _instigator] call FUNC(setDamage);

            // Don't process anymore damage if this is HEAT - shouldn't happen anyway but Arma says it does so you know
            if (_currentDamage < 1 && {_warheadType == WARHEAD_TYPE_HEAT}) then {
                _return = false;
            };
        };
    };
    default {
        TRACE_1("hit unknown hitpoint??",_hitArea);
    };
};

_return
