/*
 * Author: Commy2 and CAA-Picard
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

private ["_unit", "_weapon", "_ammo", "_projectile"];
_unit = _this select 0;
_weapon = _this select 1;
_ammo = _this select 4;
_projectile = _this select 6;

_velocity = velocity _projectile;

private ["_variableName", "_overheat", "_temperature", "_time", "_energyIncrement", "_barrelMass"];

// each weapon has it's own variable. Can't store the temperature in the weapon since they are not objects unfortunately.
_variableName = format [QGVAR(%1), _weapon];

// get old values
_overheat = _unit getVariable [_variableName, [0, 0]];
_temperature = _overheat select 0;
_time = _overheat select 1;

// Get physical parameters
_bulletMass = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_BulletMass");
if (_bulletMass == 0) then {
  // If the bullet mass is not configured, estimate it
  _bulletMass = 3.4334 + 0.5171 * (getNumber (configFile >> "CfgAmmo" >> _ammo >> "hit") + getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber"));
};
_energyIncrement = 0.75 * 0.0005 * _bulletMass * (vectorMagnitudeSqr _velocity);
_barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

// Calculate cooling
_temperature = [_temperature, _barrelMass, time - _time] call FUNC(cooldown);
// Calculate heating
_temperature = _temperature + _energyIncrement / (_barrelMass * 466); // Steel Heat Capacity = 466 J/(Kg.K)

// set updated values
_time = time;

// Publish the variable
[_unit, _variableName, [_temperature, _time], 2.0] call EFUNC(common,setVariablePublic);
