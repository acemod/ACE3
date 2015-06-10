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

private ["_typeOfProjectile","_typeOfInjury"];
_typeOfProjectile = _this select 0;
_typeOfInjury = switch (true) do {
    case (_typeOfProjectile iskindof "BulletBase"): {"Bullet"};
    case (_typeOfProjectile iskindof "GrenadeCore"): {"Grenade"};
    case (_typeOfProjectile iskindof "TimeBombCore"): {"Explosive"};
    case (_typeOfProjectile iskindof "MineCore"): {"Explosive"};
    case (_typeOfProjectile iskindof "FuelExplosion"): {"Explosive"};
    case (_typeOfProjectile iskindof "ShellBase"): {"Shell"};
    case (_typeOfProjectile iskindof "RocketBase"): {"Explosive"};
    case (_typeOfProjectile iskindof "MissileBase"): {"Explosive"};
    case (_typeOfProjectile iskindof "LaserBombCore"): {"Explosive"};
    case (_typeOfProjectile iskindof "BombCore"): {"Explosive"};
    case (_typeOfProjectile iskindof "Grenade"): {"Grenade"};
    default {_typeOfProjectile};
};
// TODO replace the capitalization on the switch results instead..
toLower _typeOfInjury;
