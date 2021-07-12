#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Process hit by projectile against vehicle and apply appropiate damage to part.
 *
 * Arguments:
 * 0: The vehicle <OBJECT>
 * 1: Projectile that hit <OBJECT>
 * 2: Hit index of potentially damaged part <NUMBER>
 * 3: New damage done to part <NUMBER>
 * 4: Information about hitpoint <ARRAY>
 * 5: Person who caused damage <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [myVehicle, projectile, 5, 0.663] call ace_vehicle_damage_fnc_processHit;
 *
 * Public: No
 */

params ["_vehicle", "_projectile", "_hitIndex", "_newDamage", "_hitpointData", "_injurer"];
_hitpointData params ["_hitArea", "_hitpointConfig", "_hitpointName"];

private _return = true;

if (_newDamage < 0) then {
    _newDamage = -_newDamage;
};

private _currentPartDamage = _vehicle getHitIndex _hitIndex;
private _nextPartDamage = _currentPartDamage + _newDamage;

// damage is high enough for immediate destruction
if (_newDamage >= 15) exitWith {
    TRACE_2("immediate destruction - high damage",_newDamage,_currentPartDamage);
    [_vehicle] call FUNC(knockOut);
    [_vehicle, 1] call FUNC(handleDetonation);
    // kill everyone inside for very insane damage
    {
        _x setDamage 1;
        _x setVariable [QEGVAR(medical,lastDamageSource), _injurer];
        _x setVariable [QEGVAR(medical,lastInstigator), _injurer];
    } forEach crew _vehicle;
    _vehicle setDamage 1;
    _return = false;
    _return
};

private _projectileConfig = _projectile call CBA_fnc_getObjectConfig;

private _warheadTypeStr = getText (_projectileConfig >> "warheadName");
private _incendiary = [_projectileConfig >> QGVAR(incendiary), "NUMBER", -1] call CBA_fnc_getConfigEntry;
private _warheadType = ["HE", "AP", "HEAT", "TandemHEAT"] find _warheadTypeStr; // numerical index for warhead type for quicker checks. Numbers defined in script_macros.hpp
if (_warheadType < 0) then {
    _warheadType = WARHEAD_TYPE_NONE;
};
if (_incendiary < 0) then {
    _incendiary = [0.3, 0.1, 1, 1, 0] select _warheadType;
};

private _minDamage = [_hitpointConfig >> "minimalHit", "NUMBER", 0] call CBA_fnc_getConfigEntry;
if (_minDamage < 0) then {
    _minDamage = -_minDamage;
};

private _ammoEffectiveness = 0;
private _projectileExplosive = [_projectileConfig >> "explosive", "NUMBER", 0] call CBA_fnc_getConfigEntry;
private _indirectHit = [_projectileConfig >> "indirectHit", "NUMBER", 0] call CBA_fnc_getConfigEntry;

if (_warheadType isEqualTo WARHEAD_TYPE_AP) then {
    // change damage based on projectile speed (doesn't do this in vanilla ARMA believe it or not)
    if !(isNull _injurer) then {
        private _airFriction = [_projectileConfig >> "airFriction", "NUMBER", 0] call CBA_fnc_getConfigEntry;
        private _distance = _injurer distance _vehicle;
        _newDamage = (1 - _projectileExplosive) * _newDamage * exp(_airFriction * _distance);
    };
};

private _penChance = 1;
if (_newDamage < _minDamage) then {
    _penChance = _newDamage / _minDamage;
    TRACE_5("minimum damage modifying hit",_newDamage,_penChance,abs _minDamage,_warheadTypeStr,_hitArea);
};

if (_penChance < random 1) exitWith {
    TRACE_1("didn't penetrate",_penChance);
    _return
};

if (_minDamage == 0) then {
    _minDamage = 1;
};

if (_warheadType isEqualTo WARHEAD_TYPE_HE) then {
    private _modifiedIndirectHit = _indirectHit / 100;
    if (_newDamage > _modifiedIndirectHit) then {
        _newDamage = _newDamage / 2;
    };
    _newDamage = (_newDamage * (_newDamage / _modifiedIndirectHit)) min _newDamage;
};

_ammoEffectiveness = if (_warheadType isEqualTo WARHEAD_TYPE_AP) then {
    0.15 max _newDamage
} else {
    if (_warheadType isEqualTo WARHEAD_TYPE_HE) then {
        (_newDamage / (_minDamage + (_indirectHit / 100)) * 0.2)
    } else {
        ((_newDamage / _minDamage) * 0.4) min 1
    };
};
TRACE_4("ammo effectiveness",_ammoEffectiveness,_newDamage,_minDamage,_warheadTypeStr);

_incendiary = _incendiary * _ammoEffectiveness;

private _isCar = (_vehicle isKindOf "Car" && { !(_vehicle isKindOf "Wheeled_APC_F") });
if (_isCar) then {
    _ammoEffectiveness = (_ammoEffectiveness + (_ammoEffectiveness * 0.5)) min 1;
};

private _injuryChance = 0;
private _injuryCount = 0;
switch (_warheadType) do {
    case WARHEAD_TYPE_AP: {
        _injuryChance = (_ammoEffectiveness * 2) min 1;
        _injuryCount = 1 + (_ammoEffectiveness * round random 9);
    };
    case WARHEAD_TYPE_HE: {
        _injuryChance = 0.03 * (1 + _ammoEffectiveness); // spalling injury chance alongside direct hit potential
        _injuryCount = 2 + (ceil random 3);
        if (_isCar) then {
            _injuryChance = 0.8;
            _injuryCount = 3 max random count crew _vehicle;
        };
    };
    default {
        _injuryChance = (4 * _ammoEffectiveness) min 1;
        _injuryCount = 2 + round random 3;
    };
};
_injuryChance = _injuryChance * _penChance;

private _currentVehicleAmmo = [_vehicle] call EFUNC(cookoff,getVehicleAmmo);
private _chanceOfDetonation = 0;
private _explosiveAmmoCount = 0;
private _nonExplosiveAmmoCount = 0;

if !(count (_currentVehicleAmmo select 0) isEqualTo 0) then {
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
        if (_explosive > 0.5 || _hit > 50) then {
            _explosiveAmmoCount = _explosiveAmmoCount + 1;
        } else {
            _nonExplosiveAmmoCount = _nonExplosiveAmmoCount + 1;
        };
    } forEach (_currentVehicleAmmo select 0);
    if (_countOfExplodableAmmo != 0) then {
        _chanceOfDetonation = _chanceOfDetonation / _countOfExplodableAmmo;
    };
};
private _chanceToDetonate = 0;
private _chanceOfFire = 0;
private _currentFuel = fuel _vehicle;
private _vehicleConfig = _vehicle call CBA_fnc_getObjectConfig;
switch (_hitArea) do {
    case "engine": {
        _chanceToDetonate = ([_vehicleConfig >> QGVAR(engineDetonationProb), "NUMBER", 0] call CBA_fnc_getConfigEntry) * _incendiary * _currentFuel * _penChance;
        _chanceOfFire = ([_vehicleConfig >> QGVAR(engineFireProb), "NUMBER", 0] call CBA_fnc_getConfigEntry) * _incendiary * _currentFuel * _penChance;
        
        private _cookoffIntensity = 4 * _currentFuel;
        TRACE_6("hit engine",_chanceToDetonate,_chanceOfFire,_incendiary,_chanceOfDetonation,_currentFuel,_cookoffIntensity);
        
        if (_isCar) then {
            _chanceOfFire = 0; // no cookoff for cars
        };
        
        if ([_vehicle, _chanceToDetonate, _currentVehicleAmmo, _explosiveAmmoCount, _nonExplosiveAmmoCount, _injurer] call FUNC(handleDetonation)) exitWith {
            [_vehicle] call FUNC(knockOut);
        };

        // cap damage at 0.9 to avoid hard coded blow up
        _nextPartDamage = (0.9 min _nextPartDamage);
        
        // fatal engine/drive system damage
        if (_nextPartDamage == 0.9 || { 0.8 * _ammoEffectiveness > random 1 }) then {
            [_vehicle, _hitIndex, _hitpointName, 0.9 * _penChance] call FUNC(addDamage);
            _vehicle setVariable [QGVAR(canMove), false];
        } else {
            [_vehicle, _hitIndex, _hitpointName, _nextPartDamage * _penChance] call FUNC(addDamage);
        };
        
        // slightly lower injury chance since this hit the engine block
        [_vehicle, _injuryChance, _injuryCount, _injurer, [0.2, 0.2, 0.2, 0.4]] call FUNC(injureOccupants);
        [_vehicle, _chanceOfFire, _cookoffIntensity, _injurer, _hitArea, false] call FUNC(handleCookoff);
    };
    case "hull": {
        _chanceToDetonate = ([_vehicleConfig >> QGVAR(hullDetonationProb), "NUMBER", 0] call CBA_fnc_getConfigEntry) * _incendiary * ((_chanceOfDetonation + _currentFuel) / 2) * _penChance;
        _chanceOfFire = ([_vehicleConfig >> QGVAR(hullFireProb), "NUMBER", 0] call CBA_fnc_getConfigEntry) * _incendiary * ((_chanceOfDetonation + _currentFuel) / 2) * _penChance;
        
        private _cookoffIntensity = 1.5 + (_explosiveAmmoCount * _chanceOfFire);
        TRACE_6("hit hull",_chanceToDetonate,_chanceOfFire,_incendiary,_chanceOfDetonation,_currentFuel,_cookoffIntensity);
        
        if (_isCar) then {
            _chanceOfFire = 0; // no cookoff for cars
        };
        
        if ([_vehicle, _chanceToDetonate, _currentVehicleAmmo, _explosiveAmmoCount, _nonExplosiveAmmoCount, _injurer] call FUNC(handleDetonation)) exitWith {
            [_vehicle, _hitIndex, _hitpointName, 0.89 * _penChance] call FUNC(addDamage);
            [_vehicle] call FUNC(knockOut);
        };
        
        [_vehicle, _injuryChance, _injuryCount, _injurer, [1, 0.4, 0.4, 1]] call FUNC(injureOccupants);
        
        private _hash = _vehicle getVariable [QGVAR(hitpointHash), []];
        private _hashKeys = [_hash] call CBA_fnc_hashKeys;
        
        // 25% chance of jamming turret - 25% of mobility kill - 25% of both - 75% chance of critical hull damage
        private _rand = random 1;
        TRACE_2("rolling hull damage",_ammoEffectiveness,_rand);
        private _partKill = [];
        if (_ammoEffectiveness > _rand) then {
            _rand = random 1;
            TRACE_2("damaged hull part",_ammoEffectiveness,_rand);
            switch (true) do {
                case (_rand < 0.25): {
                    [_vehicle, _hitIndex, _hitpointName, 0.89 * _penChance] call FUNC(addDamage);
                    // iterate through all keys and find appropriate turret
                    [_hash, {
                        if (_value#0 isEqualTo "turret") then {
                            _partKill pushBack _key;
                        };
                    }] call CBA_fnc_hashEachPair;
                    _vehicle setVariable [QGVAR(canShoot), false];
                };
                case (_rand < 0.5): {
                    [_vehicle, _hitIndex, _hitpointName, 0.89 * _penChance] call FUNC(addDamage);
                    _partKill = _partKill + ENGINE_HITPOINTS#0;
                    if !(_vehicle isKindOf "Wheeled_APC_F") then {
                        _partKill = _partKill + TRACK_HITPOINTS#0;
                    };
                    
                    _vehicle setVariable [QGVAR(canMove), false];
                };
                case (_rand < 0.75): {
                    [_vehicle, _hitIndex, _hitpointName, 0.89 * _penChance] call FUNC(addDamage);
                    _partKill = _partKill + ENGINE_HITPOINTS#0;
                    if !(_vehicle isKindOf "Wheeled_APC_F") then {
                        _partKill = _partKill + TRACK_HITPOINTS#0;
                    };
                    
                    // iterate through all keys and find appropriate turret
                    [_hash, {
                        if (_value#0 isEqualTo "turret") then {
                            _partKill pushBack _key;
                        };
                    }] call CBA_fnc_hashEachPair;
                    
                    _vehicle setVariable [QGVAR(canMove), false];
                    _vehicle setVariable [QGVAR(canShoot), false];
                };
                default{};
            };
        };
        
        {
            TRACE_1("doing damage to hitpoint", _x);
            [_vehicle, -1, _x, 1 * _penChance] call FUNC(addDamage);
        } forEach _partKill;
        
        [_vehicle, _chanceOfFire, _cookoffIntensity, _injurer, "", true] call FUNC(handleCookoff);
    };
    case "turret": {
        _chanceToDetonate = ([_vehicleConfig >> QGVAR(turretDetonationProb), "NUMBER", 0] call CBA_fnc_getConfigEntry) * _incendiary * _chanceOfDetonation * _penChance;
        _chanceOfFire = ([_vehicleConfig >> QGVAR(turretFireProb), "NUMBER", 0] call CBA_fnc_getConfigEntry) * _incendiary * _chanceOfDetonation * _penChance;
        
        private _cookoffIntensity = _explosiveAmmoCount * _chanceOfFire;
        TRACE_6("hit turret",_chanceToDetonate,_chanceOfFire,_incendiary,_chanceOfDetonation,_currentFuel,_cookoffIntensity);
        
        if (_isCar) then {
            _chanceOfFire = 0; // no cookoff for cars
        };
        
        if ([_vehicle, _chanceToDetonate, _currentVehicleAmmo, _explosiveAmmoCount, _nonExplosiveAmmoCount, _injurer] call FUNC(handleDetonation)) exitWith {
            [_vehicle] call FUNC(knockOut);
        };
        
        if (0.8 * _ammoEffectiveness > random 1) then {
            TRACE_1("damaged turret", _ammoEffectiveness * 0.8);
            [_vehicle, _hitIndex, _hitpointName, 1 * _penChance] call FUNC(addDamage);
            _vehicle setVariable [QGVAR(canShoot), false];
        };
        
        [_vehicle, _injuryChance, _injuryCount, _injurer, [0.5, 1.5, 1.5, 0.8]] call FUNC(injureOccupants);
        [_vehicle, _chanceOfFire, _cookoffIntensity, _injurer, "", true] call FUNC(handleCookoff);
    };
    case "gun": {
        TRACE_5("hit gun",_chanceToDetonate,_chanceOfFire,_incendiary,_chanceOfDetonation,_currentFuel);
        if (0.8 * _ammoEffectiveness > random 1) then {
            TRACE_1("damaged gun",_ammoEffectiveness * 0.8);
            [_vehicle, _hitIndex, _hitpointName, 1 * _penChance] call FUNC(addDamage);
            _vehicle setVariable [QGVAR(canShoot), false];
        };
    };
    case "track": {
        private _damage = (0.1 max (0.1 * _newDamage / _minDamage)) min 1;
        [_vehicle, _hitIndex, _hitpointName, (_currentPartDamage + _damage) * _penChance] call FUNC(addDamage);
        TRACE_3("damaged track",_damage,_newDamage,_minDamage);
        
        if ((_vehicle getHitIndex _hitIndex) >= 1) then {
            _vehicle setVariable [QGVAR(canMove), false];
        };
    };
    case "wheel": {
        [_vehicle, _hitIndex, _hitpointName, (_currentPartDamage + _newDamage) * _penChance] call FUNC(addDamage);
        TRACE_1("damaged wheel",_newDamage);
    };
    case "fuel": {
        _chanceOfFire = (_incendiary * _currentFuel * _penChance) / 2;
        private _cookoffIntensity = _currentFuel * 5;
        TRACE_2("damaged fuel",_chanceOfFire,_cookoffIntensity);
        
        if (_isCar) then {
            _chanceOfFire = 0; // no cookoff for cars
        };
        
        [_vehicle, _chanceOfFire, _cookoffIntensity, _injurer, "", false] call FUNC(handleCookoff);
        
        private _damage = (0.1 max (0.1 * _newDamage / _minDamage)) min 1;
        [_vehicle, _hitIndex, _hitpointName, (_currentPartDamage + _damage) * _penChance] call FUNC(addDamage);
    };
    case "slat": {
        TRACE_2("hit slat",_warheadType,_warheadTypeStr);
        // incredibly small chance of AP destroying SLAT
        if (_warheadType isEqualTo WARHEAD_TYPE_HEAT || { _warheadType isEqualTo WARHEAD_TYPE_TANDEM } || { _warheadType isEqualTo WARHEAD_TYPE_HE } || { 0.01 > random 1 }) then {
            private _currentDamage = _vehicle getHitIndex _hitIndex;
            TRACE_3("damaged slat",_warheadType,_warheadTypeStr,_currentDamage);
            
            if (_warheadType isEqualTo WARHEAD_TYPE_HEAT || { _warheadType isEqualTo WARHEAD_TYPE_TANDEM }) then {
                [_vehicle, _hitIndex, _hitpointName, 1] call FUNC(addDamage);
            } else {
                [_vehicle, _hitIndex, _hitpointName, _currentDamage + (0.5 max random 1)] call FUNC(addDamage);
            };
            
            if (_currentDamage < 1 && _warheadType isEqualTo WARHEAD_TYPE_HEAT) then {
                _return = false;
            };
        };
    };
    case "era": {
        TRACE_2("hit era",_warheadType,_warheadTypeStr);
        if (_warheadType isEqualTo WARHEAD_TYPE_HEAT || { _warheadType isEqualTo WARHEAD_TYPE_TANDEM } || { 0.05 > random 1 }) then {
            private _currentDamage = _vehicle getHitIndex _hitIndex;
            TRACE_3("damaged era",_warheadType,_warheadTypeStr,_currentDamage);
            [_vehicle, _hitIndex, _hitpointName, 1] call FUNC(addDamage);
            
            // dont process anymore damage if this is HEAT - shouldnt happen anyway but ARMA says it does so you know
            if (_currentDamage < 1 && _warheadType isEqualTo WARHEAD_TYPE_HEAT) then {
                _return = false;
            };
        };
    };
    default {
        TRACE_1("hit unknown hitpoint??",_hitArea);
    }
};

_return
