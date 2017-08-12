/*
 * Author: Glowbal
 * Get the type of damage based upon the projectile.
 *
 * Arguments:
 * 0: The projectile classname or object <STRING>
 *
 * Return Value:
 * Type of damage <STRING>
 *
 * Example:
 * ["bullet"] call ACE_medical_fnc_getTypeOfDamage
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_typeOfProjectile"];


if (_typeOfProjectile isKindOf "BulletBase") exitWith {"bullet"};
if (_typeOfProjectile isKindOf "ShotgunBase") exitWith {"bullet"};
if (_typeOfProjectile isKindOf "GrenadeCore") exitWith {"grenade"};
if (_typeOfProjectile isKindOf "TimeBombCore") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "MineCore") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "FuelExplosion") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "ShellBase") exitWith {"shell"};
if (_typeOfProjectile isKindOf "RocketBase") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "MissileBase") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "LaserBombCore") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "BombCore") exitWith {"explosive"};
if (_typeOfProjectile isKindOf "Grenade") exitWith {"grenade"};
toLower _typeOfProjectile
