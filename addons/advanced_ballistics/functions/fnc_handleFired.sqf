#include "..\script_component.hpp"
/*
 * Author: Glowbal, Ruthberg, Brett Mayson
 * Handles advanced ballistics for (BulletBase) projectiles. Called from the unified fired EH only for players.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_handleFired
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle,_gunner,_turret);

if !(_ammo isKindOf "BulletBase") exitWith {};
if (!alive _projectile) exitWith {};
if (underwater _unit) exitWith {};

private _bulletVelocity = velocity _projectile;
private _muzzleVelocity = vectorMagnitude _bulletVelocity;
private _abort = !local _unit;

// Estimate if a bullet from a remote unite needs to be accurately simulated
if (_abort) then {
    private _maxRange = GVAR(maxRange) getOrDefaultCall [_ammo, {
        private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
        private _airFriction = getNumber (_ammoConfig >> "airFriction");
        private _vanillaInitialSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");

        private _maxRange = if (_airFriction < 0) then {
            private _maxTime = ((_vanillaInitialSpeed - BULLET_TRACE_MIN_VELOCITY) / (BULLET_TRACE_MIN_VELOCITY * -_airFriction * _vanillaInitialSpeed)) max getNumber (_ammoConfig >> "tracerEndTime");
            -ln (1 - _airFriction * _vanillaInitialSpeed * _maxTime) / _airFriction
        } else {
            _vanillaInitialSpeed * getNumber (_ammoConfig >> "tracerEndTime")
        };

        _maxRange * 1.3 // Adding 30% more to range just to be safe
    }, true];

    if (ACE_player distance _unit > _maxRange && {ACE_player distance ((getPosASL _unit) vectorAdd ((vectorNormalized _bulletVelocity) vectorMultiply _maxRange)) > _maxRange}) exitWith {};

    // If the bullet is a tracer bullet, it needs to be accurately simulated
    _abort = !(_projectile getShotInfo 4); // 4=shownTracer
};

private _bulletTraceVisible = false;

// If the bullet can be observed accurately, then simulate the bullet accurately as well
if (GVAR(bulletTraceEnabled) && {_muzzleVelocity > BULLET_TRACE_MIN_VELOCITY} && {cameraView == "GUNNER"}) then {
    private _currentWeapon = currentWeapon ACE_player;

    if (_currentWeapon == binocular ACE_player) exitWith {
        _bulletTraceVisible = true;
        _abort = false;
    };

    if (_currentWeapon == primaryWeapon ACE_player) then {
        private _opticsName = (primaryWeaponItems ACE_player) select 2;
        private _opticType = getNumber (configFile >> "CfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");

        if (_opticType == 2) then {
            _bulletTraceVisible = true;
            _abort = false;
        };
    };
};

if (_abort) exitWith {};

// Get Weapon and Ammo Configurations
(_ammo call FUNC(readAmmoDataFromConfig)) params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocityVariationSD"];
([_weapon, _muzzle] call FUNC(readWeaponDataFromConfig)) params ["_barrelTwist", "_twistDirection", "_barrelLength"];

private _temperature = nil; // We need the variable in this scope. So we need to init it here.
private _ammoCount = _unit ammo _muzzle;

if (GVAR(barrelLengthInfluenceEnabled)) then {
    _muzzleVelocity = _muzzleVelocity + ([_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _muzzleVelocity] call FUNC(calculateBarrelLengthVelocityShift));
};

if (GVAR(ammoTemperatureEnabled)) then {
    _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    _muzzleVelocity = _muzzleVelocity + ([_ammoTempMuzzleVelocityShifts, _temperature] call FUNC(calculateAmmoTemperatureVelocityShift));
};

if (GVAR(muzzleVelocityVariationEnabled)) then {
    private _time = round (CBA_missionTime / 2);
    // Generate seed from publicly known values (via Cantor pairing function)
    private _seed = 0.5 * (_time + _ammoCount) * (_time + _ammoCount + 1) + _ammoCount;
    // Generate normally distributed random number (via Box–Muller transform)
    private _z = sqrt (-2.0 * ln (0.00000001 max (-_seed random 1))) * cos (_seed random 360);

    _muzzleVelocity = _muzzleVelocity * (_z * _muzzleVelocityVariationSD + 1);
};

_bulletVelocity = (vectorNormalized _bulletVelocity) vectorMultiply _muzzleVelocity;
_projectile setVelocity _bulletVelocity;

private _stabilityFactor = if (_caliber * _bulletLength * _bulletMass * _barrelTwist > 0) then {
    if (isNil "_temperature") then {
        _temperature = ((getPosASL _unit) select 2) call EFUNC(weather,calculateTemperatureAtHeight);
    };

    private _barometricPressure = ((getPosASL _projectile) select 2) call EFUNC(weather,calculateBarometricPressure);
    [_caliber, _bulletLength, _bulletMass, _barrelTwist, _muzzleVelocity, _temperature, _barometricPressure] call FUNC(calculateStabilityFactor);
} else {
    1.5
};

("ace" callExtension [
    "ballistics:bullet:new", [
        _ammoCount,
        _airFriction,
        _ballisticCoefficients,
        _velocityBoundaries,
        _atmosphereModel,
        _dragModel,
        _stabilityFactor,
        _twistDirection,
        _transonicStabilityCoef,
        _bulletVelocity,
        EGVAR(common,mapLatitude),
        EGVAR(weather,currentTemperature),
        EGVAR(common,mapAltitude),
        EGVAR(weather,currentHumidity),
        EGVAR(weather,currentOvercast),
        CBA_missionTime toFixed 6
    ]
]) params ["_id", "_code"];

if (_code == 0) then {
    GVAR(allBullets) set [_id, [_projectile, _caliber, _bulletTraceVisible]];
};
