/**
 * fn_getTypeOfDamage_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
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
	case (_typeOfProjectile == "VehicleCrash"): {"VehicleCrash"};
	default {"Unknown"};
};
_typeOfInjury