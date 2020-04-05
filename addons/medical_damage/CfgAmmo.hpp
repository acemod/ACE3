class CfgAmmo {
    class BulletCore;
    class BulletBase: BulletCore {
        ACE_damageType = "bullet";
    };
    class ShotgunCore;
    class ShotgunBase: ShotgunCore {
        ACE_damageType = "bullet";
    };

    class Default;
    class FuelExplosion: Default {
        ACE_damageType = "explosive";
    };
    class Grenade: Default {
        ACE_damageType = "grenade";
    };
    class GrenadeCore;
    class GrenadeBase: GrenadeCore {
        ACE_damageType = "grenade";
    };

    class MineCore;
    class MineBase: MineCore {
        ACE_damageType = "explosive";
    };
    class PipeBombCore;
    class PipeBombBase: PipeBombCore {
        ACE_damageType = "explosive";
    };
    class DirectionalBombCore;
    class DirectionalBombBase: DirectionalBombCore {
        ACE_damageType = "explosive";
    };
    class BoundingMineCore;
    class BoundingMineBase: BoundingMineCore {
        ACE_damageType = "explosive";
    };

    class RocketCore;
    class RocketBase: RocketCore {
        ACE_damageType = "explosive";
    };
    class MissileCore;
    class MissileBase: MissileCore {
        ACE_damageType = "explosive";
    };

    class SubmunitionCore;
    class SubmunitionBase: SubmunitionCore {
        ACE_damageType = "explosive";
    };
    class SubmunitionBullet: SubmunitionBase {
        ACE_damageType = "bullet";
    };

    class ShellCore;
    class ShellBase: ShellCore {
        ACE_damageType = "shell";
    };

    // There is no BombBase so we modify these separately
    class BombCore;
    class Bo_Mk82: BombCore {
        ACE_damageType = "explosive";
    };
    class LaserBombCore;
    class ammo_Bomb_LaserGuidedBase: LaserBombCore {
        ACE_damageType = "explosive";
    };
    class BombDemine_01_Ammo_F: BombCore {
        ACE_damageType = "explosive";
    };
    
    // Autocannon rounds are special (#7401)
    class B_19mm_HE: BulletBase {
        ACE_damageType = "explosive";
    };
    class B_20mm: BulletBase {
        ACE_damageType = "explosive";
    };
    class B_25mm: BulletBase {
        ACE_damageType = "explosive";
    };
    class B_35mm_AA: BulletBase {
        ACE_damageType = "explosive";
    };

    // These are also special
    class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
        ACE_damageType = "explosive";
    };
};
