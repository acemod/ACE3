/*
 * Author: Glowbal
 * Get the type of damage based upon the projectile.
 *
 * Arguments:
 * 0: The projectile classname or object <STRING>
 *
 * ReturnValue:
 * Type of damage <STRING>
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_typeOfProjectile);

private ["_typeOfDamage"];

_typeOfDamage = switch (true) do {
    case (_typeOfProjectile isKindOf "BulletBase"): {"bullet"};
    case (_typeOfProjectile isKindOf "GrenadeCore"): {"grenade"};
    case (_typeOfProjectile isKindOf "TimeBombCore"): {"explosive"};
    case (_typeOfProjectile isKindOf "MineCore"): {"explosive"};
    case (_typeOfProjectile isKindOf "FuelExplosion"): {"explosive"};
    case (_typeOfProjectile isKindOf "ShellBase"): {"shell"};
    case (_typeOfProjectile isKindOf "RocketBase"): {"explosive"};
    case (_typeOfProjectile isKindOf "MissileBase"): {"explosive"};
    case (_typeOfProjectile isKindOf "LaserBombCore"): {"explosive"};
    case (_typeOfProjectile isKindOf "BombCore"): {"explosive"};
    case (_typeOfProjectile isKindOf "Grenade"): {"grenade"};
    default {toLower _typeOfProjectile};
};

_typeOfDamage
