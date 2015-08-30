/*
 * Author: Commy2 and esteldunedain
 * Handle weapon fire, heat up the weapon
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 3: Muzzle <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

private ["_unit", "_weapon", "_ammo", "_projectile", "_velocity", "_variableName", "_overheat", "_temperature", "_time", "_bulletMass", "_energyIncrement", "_barrelMass", "_scaledTemperature", "_intensity", "_position", "_direction", "_dispersion", "_count", "_slowdownFactor", "_jamChance", "_surface"];

_unit = _this select 0;
_weapon = _this select 1;
_ammo = _this select 4;
_projectile = _this select 6;

_velocity = velocity _projectile;

// each weapon has it's own variable. Can't store the temperature in the weapon since they are not objects unfortunately.
_variableName = format [QGVAR(%1), _weapon];

// get old values
_overheat = _unit getVariable [_variableName, [0, 0]];
_temperature = _overheat select 0;
_time = _overheat select 1;

// Get physical parameters
_bulletMass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_BulletMass");
if (_bulletMass == 0) then {
  // If the bullet mass is not configured, estimate it directly in grams
  _bulletMass = 3.4334 + 0.5171 * (getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit") + getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber"));
};
_energyIncrement = 0.75 * 0.0005 * _bulletMass * (vectorMagnitudeSqr _velocity);
_barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

// Calculate cooling
_temperature = [_temperature, _barrelMass, ACE_time - _time] call FUNC(cooldown);
// Calculate heating
_temperature = _temperature + _energyIncrement / (_barrelMass * 466); // Steel Heat Capacity = 466 J/(Kg.K)

// set updated values
_time = ACE_time;
_unit setVariable [_variableName, [_temperature, _time], false];
_scaledTemperature = (_temperature / 1000) min 1 max 0;

// Smoke SFX, beginning at TEMP 0.15
private "_intensity";

_intensity = (_scaledTemperature - 0.2) * 1.25;
if (_intensity > 0) then {
  private ["_position", "_direction"];

  _position = position _projectile;
  _direction = (_unit weaponDirection _weapon) vectorMultiply 0.25;

  drop [
    "\A3\data_f\ParticleEffects\Universal\Refract",
    "",
    "Billboard",
    1.1,
    2,
    _position,
    _direction,
    1,
    1.2,
    1.0,
    0.1,
    [0.1,0.15],
    [[0.06,0.06,0.06,0.32*_scaledTemperature], [0.3,0.3,0.3,0.28*_scaledTemperature], [0.3,0.3,0.3,0.25*_scaledTemperature], [0.3,0.3,0.3,0.22*_scaledTemperature], [0.3,0.3,0.3,0.1*_scaledTemperature]],
    [1,0],
    0.1,
    0.05,
    "",
    "",
    ""
  ];

  _intensity = (_scaledTemperature - 0.5) * 2;
  if (_intensity > 0) then {
    drop [
      ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 1, 16],
      "",
      "Billboard",
      1,
      1.2,
      _position,
      [0,0,0.25],
      0,
      1.275,
      1,
      0.025,
      [0.28,0.33,0.37],
      [[0.6,0.6,0.6,0.3*_intensity]],
      [0.2],
      1,
      0.04,
      "",
      "",
      ""
    ];
  };
};


// dispersion and bullet slow down
private ["_dispersion", "_slowdownFactor", "_count"];

_dispersion = getArray (configFile >> "CfgWeapons" >> _weapon >> "ACE_Overheating_Dispersion");

_count = count _dispersion;
if (_count > 0) then {
  _dispersion = ([_dispersion, (_count - 1) * _scaledTemperature] call EFUNC(common,interpolateFromArray)) max 0;
} else {
  _dispersion = 0;
};

_slowdownFactor = getArray (configFile >> "CfgWeapons" >> _weapon >> "ACE_Overheating_slowdownFactor");

_count = count _slowdownFactor;
if (_count > 0) then {
  _slowdownFactor = ([_slowdownFactor, (_count - 1) * _scaledTemperature] call EFUNC(common,interpolateFromArray)) max 0;
} else {
  _slowdownFactor = 1;
};

[_projectile, _dispersion - 2 * random _dispersion, _dispersion - 2 * random _dispersion, (_slowdownFactor - 1) * vectorMagnitude _velocity] call EFUNC(common,changeProjectileDirection);


// jamming
private "_jamChance";

_jamChance = getArray (configFile >> "CfgWeapons" >> _weapon >> "ACE_Overheating_jamChance");

_count = count _jamChance;
if (_count == 0) then {
  _jamChance = [0];
  _count = 1;
};

_jamChance = [_jamChance, (_count - 1) * _scaledTemperature] call EFUNC(common,interpolateFromArray);

// increase jam chance on dusty grounds if prone
if (stance _unit == "PRONE") then {
  private "_surface";
  _surface = toArray (surfaceType getPosASL _unit);
  _surface deleteAt 0;

  _surface = configFile >> "CfgSurfaces" >> toString _surface;
  if (isClass _surface) then {
    _jamChance = _jamChance + (getNumber (_surface >> "dust")) * _jamChance;
  };
};

if ("Jam" in (missionNamespace getvariable ["ACE_Debug", []])) then {
  _jamChance = 0.5;
};

["Overheating", [_temperature, _jamChance], {format ["Temperature: %1 - JamChance: %2", _this select 0, _this select 1]}] call EFUNC(common,log);

if (random 1 < _jamChance) then {
  [_unit, _weapon] call FUNC(jamWeapon);
};
