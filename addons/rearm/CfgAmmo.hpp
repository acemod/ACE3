class CfgAmmo {
    
    class BombCore;
    class BombBase : BombCore {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
    class LaserBombCore : BombCore {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
    class MissileCore;
    class MissileBase : MissileCore {
        ace_logistics_caliber = 250; // Default caliber for missiles
    };
    class Rocket_04_HE_F : MissileBase {
        ace_logistics_caliber = 70;
    };
    class M_PG_AT : MissileBase {
        ace_logistics_caliber = 100;
    };
    class ACE_Hydra70_DAGR : M_PG_AT {
        ace_logistics_caliber = 70;
    };
    
    class RocketCore;
    class RocketBase : RocketCore {
        ace_logistics_caliber = 70; // Default caliber for rockets
    };
    class R_80mm_HE : RocketBase {
        ace_logistics_caliber = 80;
    };
    class R_60mm_HE : R_80mm_HE {
        ace_logistics_caliber = 60;
    };
    
    class BulletBase;
    
    class B_19mm_HE : BulletBase {
        ace_logistics_caliber = 19; 
    };
    
    class B_20mm : BulletBase {
        ace_logistics_caliber = 20; 
    };
    
    class B_25mm : BulletBase {
        ace_logistics_caliber = 25; 
    };

    class B_30mm_AP : BulletBase {
        ace_logistics_caliber = 30; 
    };
    class B_30mm_HE : B_19mm_HE {
        ace_logistics_caliber = 30; 
    };
    class Gatling_30mm_HE_Plane_CAS_01_F : BulletBase {
        ace_logistics_caliber = 30; 
    };
    
    class B_35mm_AA : BulletBase {
        ace_logistics_caliber = 35; 
    };
    
    class B_30mm_APFSDS;
    class B_40mm_APFSDS : B_30mm_APFSDS {
        ace_logistics_caliber = 40; 
    };
    
    class B_40mm_GPR : B_30mm_HE {
        ace_logistics_caliber = 40; 
    };

    class GrenadeBase;
    class G_40mm_HE : GrenadeBase {
        ace_logistics_caliber = 40; 
    };

    class RDS_B_127x107_Ball : BulletBase {
        ace_logistics_caliber = 12.7; 
    };
 
    class ShellBase;
    class Sh_120mm_APFSDS : Shellbase {
        ace_logistics_caliber = 120; 
    };
    class Sh_105mm_APFSDS : Sh_120mm_APFSDS {
        ace_logistics_caliber = 105; 
    };
    class Sh_125mm_APFSDS : Sh_120mm_APFSDS {
        ace_logistics_caliber = 125; 
    };
    
    class Sh_120mm_HE : ShellBase {
        ace_logistics_caliber = 120; 
    };
    class Sh_125mm_HE : Sh_120mm_HE {
        ace_logistics_caliber = 125; 
    };
    class Sh_125mm_HEAT : Sh_125mm_HE {
        ace_logistics_caliber = 125; 
    };
    class Sh_105mm_HEAT_MP : Sh_125mm_HEAT {
        ace_logistics_caliber = 105; 
    };
    
    class Sh_155mm_AMOS : ShellBase {
        ace_logistics_caliber = 155; 
    };
    class Sh_82mm_AMOS : Sh_155mm_AMOS {
        ace_logistics_caliber = 82; 
    };
    class RDS_Sh_122_HE : Sh_155mm_AMOS {
        ace_logistics_caliber = 122; 
    };
    class RDS_Sh_105_HE : Sh_155mm_AMOS {
        ace_logistics_caliber = 105; 
    };
    
    class Sh_82mm_AMOS_LG;
    class Sh_155mm_AMOS_LG : Sh_82mm_AMOS_LG {
        ace_logistics_caliber = 155; 
    };
    class RDS_Sh_122_LASER : Sh_155mm_AMOS_LG {
        ace_logistics_caliber = 122; 
    };
    class RDS_Sh_105_LASER : Sh_155mm_AMOS_LG {
        ace_logistics_caliber = 105; 
    };
    
    class ShotDeployBase;
    class Smoke_82mm_AMOS_White : ShotDeployBase {
        ace_logistics_caliber = 82; 
    };
    
    class FlareCore;
    class Flare_82mm_AMOS_White : FlareCore {
        ace_logistics_caliber = 82; 
    };
        
    class SmokeLauncherAmmo : BulletBase {
        ace_logistics_caliber = 250; 
    };
    
    class CMflareAmmo : BulletBase {
        ace_logistics_caliber = 40;
    };
    
    class SubmunitionBase;
    class Sh_82mm_AMOS_guided : SubmunitionBase {
        ace_logistics_caliber = 82; 
    };
    class Sh_155mm_AMOS_guided : Sh_82mm_AMOS_guided {
        ace_logistics_caliber = 155; 
    };
    class R_230mm_HE : SubmunitionBase {
        ace_logistics_caliber = 230; 
    };
    class rhs_ammo_127x108mm_x5 : SubmunitionBase {
        ace_logistics_caliber = 12.7; 
    };
    class Mine_155mm_AMOS_range : SubmunitionBase {
        ace_logistics_caliber = 155; 
    };
    class Cluster_155mm_AMOS : SubmunitionBase {
        ace_logistics_caliber = 155; 
    };
    class Smoke_120mm_AMOS_White : SubmunitionBase {
        ace_logistics_caliber = 155; 
    };
    class AT_Mine_155mm_AMOS_range : SubmunitionBase {
        ace_logistics_caliber = 155; 
    };
    
    class rhs_ammo_rpgShell_base : ShellBase {
        ace_logistics_caliber = 70; 
    };
    
    class Bomb_04_F : LaserBombCore {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
    class Bo_GBU12_LGB : LaserBombCore {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
    class js_a_fa18_wing_tank : LaserBombCore {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
    
    class js_a_fa18x_MK82 : BombCore {};
    class js_a_fa18x_GBU39_SDB : js_a_fa18x_MK82 {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
    
    class js_a_fa18_GBU12_LGB : LaserBombCore {};
    class js_a_fa18_GBU38_JDAM : js_a_fa18_GBU12_LGB {
        ace_logistics_caliber = 250; // Default caliber for bombs
    };
};
