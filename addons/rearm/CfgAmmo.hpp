class CfgAmmo {

    class BombCore;
    class LaserBombCore : BombCore {
        GVAR(caliber) = 250; // Default caliber for bombs
    };
    class MissileCore;
    class MissileBase : MissileCore {
        GVAR(caliber) = 250; // Default caliber for missiles
    };
    class Missile_AA_04_F : MissileBase {
        GVAR(dummy) = QGVAR(Missile_AA_04_F);
    };
    class Missile_AA_03_F : Missile_AA_04_F {
        GVAR(dummy) = QGVAR(Missile_AA_03_F);
    };

    class Rocket_04_HE_F : MissileBase {
        GVAR(caliber) = 70;
        GVAR(dummy) = QGVAR(Rocket_04_HE_F);
    };
    class Rocket_03_HE_F : Rocket_04_HE_F {
        GVAR(dummy) = QGVAR(Rocket_03_HE_F);
    };
    class Rocket_04_AP_F : Rocket_04_HE_F {
        GVAR(dummy) = QGVAR(Rocket_04_AP_F);
    };
    class Rocket_03_AP_F : Rocket_04_AP_F {
        GVAR(dummy) = QGVAR(Rocket_03_AP_F);
    };
    class M_PG_AT : MissileBase {
        GVAR(caliber) = 70;
        GVAR(dummy) = QGVAR(M_PG_AT);
    };
    class Missile_AGM_02_F : MissileBase {
        GVAR(dummy) = QGVAR(Missile_AGM_02_F);
    };
    class Missile_AGM_01_F : Missile_AGM_02_F {
        GVAR(dummy) = QGVAR(Missile_AGM_01_F);
    };

    class RocketCore;
    class RocketBase : RocketCore {
        GVAR(caliber) = 70; // Default caliber for rockets
    };
    class R_80mm_HE : RocketBase {
        GVAR(caliber) = 80;
        GVAR(dummy) = QGVAR(R_80mm_HE);
    };
    class R_60mm_HE : R_80mm_HE {
        GVAR(caliber) = 60;
        GVAR(dummy) = QGVAR(R_60mm_HE);
    };

    class BulletBase;
    class B_19mm_HE : BulletBase {
        GVAR(caliber) = 19;
    };

    class B_20mm : BulletBase {
        GVAR(caliber) = 20;
    };
    class B_20mm_AP: BulletBase {
        GVAR(caliber) = 20;
    };

    class B_25mm : BulletBase {
        GVAR(caliber) = 25;
    };

    class B_30mm_AP : BulletBase {
        GVAR(caliber) = 30;
    };
    class B_30mm_HE : B_19mm_HE {
        GVAR(caliber) = 30;
    };
    class Gatling_30mm_HE_Plane_CAS_01_F : BulletBase {
        GVAR(caliber) = 30;
    };

    class B_35mm_AA : BulletBase {
        GVAR(caliber) = 35;
    };

    class B_30mm_APFSDS;
    class B_40mm_APFSDS : B_30mm_APFSDS {
        GVAR(caliber) = 40;
    };

    class B_40mm_GPR : B_30mm_HE {
        GVAR(caliber) = 40;
    };

    class GrenadeBase;
    class G_40mm_HE : GrenadeBase {
        GVAR(caliber) = 39;
    };

    class ShellBase;
    class R_230mm_fly : ShellBase {
        GVAR(dummy) = QGVAR(R_230mm_fly);
    };

    class Sh_120mm_APFSDS : Shellbase {
        GVAR(caliber) = 120;
    };
    class Sh_105mm_APFSDS : Sh_120mm_APFSDS {
        GVAR(caliber) = 105;
    };
    class Sh_125mm_APFSDS : Sh_120mm_APFSDS {
        GVAR(caliber) = 125;
    };

    class Sh_120mm_HE : ShellBase {
        GVAR(caliber) = 120;
    };
    class Sh_125mm_HE : Sh_120mm_HE {
        GVAR(caliber) = 125;
    };
    class Sh_125mm_HEAT : Sh_125mm_HE {
        GVAR(caliber) = 125;
    };
    class Sh_105mm_HEAT_MP : Sh_125mm_HEAT {
        GVAR(caliber) = 105;
    };

    class Sh_155mm_AMOS : ShellBase {
        GVAR(caliber) = 155;
    };
    class Sh_82mm_AMOS : Sh_155mm_AMOS {
        GVAR(caliber) = 82;
    };

    class Sh_82mm_AMOS_LG;
    class Sh_155mm_AMOS_LG : Sh_82mm_AMOS_LG {
        GVAR(caliber) = 155;
    };

    class ShotDeployBase;
    class Smoke_82mm_AMOS_White : ShotDeployBase {
        GVAR(caliber) = 82;
    };

    class FlareCore;
    class Flare_82mm_AMOS_White : FlareCore {
        GVAR(caliber) = 82;
    };

    class SmokeLauncherAmmo : BulletBase {
        GVAR(caliber) = 250;
    };

    class CMflareAmmo : BulletBase {
        GVAR(caliber) = 39;
    };

    class SubmunitionBase;
    class Sh_82mm_AMOS_guided : SubmunitionBase {
        GVAR(caliber) = 82;
    };
    class Sh_155mm_AMOS_guided : Sh_82mm_AMOS_guided {
        GVAR(caliber) = 155;
    };
    class R_230mm_HE : SubmunitionBase {
        GVAR(caliber) = 230;
    };
    class Mine_155mm_AMOS_range : SubmunitionBase {
        GVAR(caliber) = 155;
    };
    class Cluster_155mm_AMOS : SubmunitionBase {
        GVAR(caliber) = 155;
    };
    class Smoke_120mm_AMOS_White : SubmunitionBase {
        GVAR(caliber) = 155;
    };
    class AT_Mine_155mm_AMOS_range : SubmunitionBase {
        GVAR(caliber) = 155;
    };

    class Bo_Mk82 : BombCore {
        GVAR(dummy) = QGVAR(Bo_Mk82);
    };

    class ammo_Bomb_LaserGuidedBase: LaserBombCore {};
    class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {
        GVAR(caliber) = 250; // Default caliber for bombs
        GVAR(dummy) = QGVAR(Bo_GBU12_LGB);
    };

    class Bomb_04_F: ammo_Bomb_LaserGuidedBase {
        GVAR(caliber) = 250; // Default caliber for bombs
        GVAR(dummy) = QGVAR(Bomb_04_F);
    };

    class Bomb_03_F: ammo_Bomb_LaserGuidedBase {
        GVAR(dummy) = QGVAR(Bomb_03_F);
    };
};
