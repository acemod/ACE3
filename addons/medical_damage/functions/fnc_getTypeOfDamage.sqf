#include "script_component.hpp"
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
 * ["bullet"] call ace_medical_damage_fnc_getTypeOfDamage
 *
 * Public: No
 */

params ["_typeOfProjectile"];

// --- projectiles
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

// --- non-projectiles reported by custom handleDamge wrapper
if ((_typeOfProjectile select [0,1]) isEqualTo "#") then {
    _typeOfProjectile = _typeOfProjectile select [1];
};

// --- otherwise
toLower _typeOfProjectile
