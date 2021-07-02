class CfgAmmo {
    class Default;
    class BulletCore;
    class ShellCore;
    class MissileCore;
    class GrenadeCore;
    class LaserBombCore;
    class RocketCore;
    class MineCore;
    class BombCore;
    class DirectionalBombCore;
    class PipeBombCore;
    
    class B_30mm_HE;
    class GrenadeHand;
    class R_PG32V_F;
    class SubmunitionBase;
    class Sh_125mm_HE;
    class M_Vorona_HEAT;
    class M_SPG9_HEAT;
    class R_MRAAWS_HEAT_F;
    class B_338_Ball;
    
    class ACE_G_40mm_HE;
    
    CREATE_INCENDIARY_AMMO(BulletBase,                      BulletCore,             0.5);
    CREATE_INCENDIARY_AMMO(ShellBase,                       ShellCore,              1.0);
    CREATE_INCENDIARY_AMMO(ammo_Penetrator_Base,            ShellBase,              1.0);
    CREATE_INCENDIARY_AMMO(MissileBase,                     MissileCore,            1.0);
    CREATE_INCENDIARY_AMMO(ammo_Missile_CruiseBase,         MissileBase,            0.5);
    CREATE_INCENDIARY_AMMO(GrenadeBase,                     GrenadeCore,            0.1);
    CREATE_INCENDIARY_AMMO(Grenade,                         Default,                0.0);
    CREATE_INCENDIARY_AMMO(ammo_bomb_LaserGuidedBase,       LaserBombCore,          0.6);
    CREATE_INCENDIARY_AMMO(RocketBase,                      RocketCore,             1.0);
    CREATE_INCENDIARY_AMMO(MineBase,                        MineCore,               0.5);
    CREATE_INCENDIARY_AMMO(DirectionalBombBase,             DirectionalBombCore,    1.0);
    CREATE_INCENDIARY_AMMO(PipeBombBase,                    PipeBombCore,           0.7);
    CREATE_INCENDIARY_AMMO(ammo_Missile_AntiRadiationBase,  MissileBase,            1.0);
    CREATE_INCENDIARY_AMMO(ammo_Gun20mmAABase,              BulletBase,             0.7);
    CREATE_INCENDIARY_AMMO(ammo_Gun30mmAABase,              BulletBase,             0.7);
    CREATE_INCENDIARY_AMMO(ammo_Gun35mmAABase,              BulletBase,             0.7);
    CREATE_INCENDIARY_AMMO(ammo_Missile_CannonLaunchedBase, MissileBase,            1.0);
    
    CREATE_INCENDIARY_AMMO(B_127x99_Ball,                   BulletBase,             0.2);
    CREATE_INCENDIARY_AMMO(B_127x99_SLAP,                   B_127x99_Ball,          0.8);
    CREATE_INCENDIARY_AMMO(B_127x108_Ball,                  BulletBase,             0.3);
    CREATE_INCENDIARY_AMMO(B_127x108_APDS,                  B_127x108_Ball,         0.1);

    CREATE_INCENDIARY_AMMO(B_30mm_MP,                       B_30mm_HE,              0.6);
    CREATE_INCENDIARY_AMMO(B_40mm_GPR,                      B_30mm_HE,              0.6);
    CREATE_INCENDIARY_AMMO(B_20mm,                          BulletBase,             0.2);
    CREATE_INCENDIARY_AMMO(B_25mm,                          BulletBase,             0.4);
    CREATE_INCENDIARY_AMMO(B_30mm_AP,                       BulletBase,             0.4);
    CREATE_INCENDIARY_AMMO(B_30mm_APFSDS,                   B_30mm_AP,              0.1);
    CREATE_INCENDIARY_AMMO(B_35mm_AA,                       BulletBase,             0.7);
    CREATE_INCENDIARY_AMMO(SmokeShell,                      GrenadeHand,            0.0);


    CREATE_INCENDIARY_AMMO(ammo_Penetrator_30mm,            ammo_Penetrator_Base,   0.8);
    CREATE_INCENDIARY_AMMO(ammo_Penetrator_grenade_40mm,    ammo_Penetrator_Base,   1.0);
    CREATE_INCENDIARY_AMMO(ammo_Penetrator_105mm,           ammo_Penetrator_Base,   1.0);
    CREATE_INCENDIARY_AMMO(ammo_Penetrator_120mm,           ammo_Penetrator_Base,   1.0);
    CREATE_INCENDIARY_AMMO(ammo_Penetrator_Rocket_03_AP,    ammo_Penetrator_Base,   0.7);
    CREATE_INCENDIARY_AMMO(ammo_Penetrator_Rocket_04_AP,    ammo_Penetrator_Base,   0.7);
    
    CREATE_INCENDIARY_AMMO(Sh_120mm_HE,                     ShellBase,              0.4);
    CREATE_INCENDIARY_AMMO(Sh_120mm_APFSDS,                 ShellBase,              0.1);
    CREATE_INCENDIARY_AMMO(Sh_120mm_HEAT_MP,                ShellBase,              0.8);
    CREATE_INCENDIARY_AMMO(Sh_155mm_AMOS,                   ShellBase,              0.4);
    CREATE_INCENDIARY_AMMO(Sh_82mm_AMOS,                    Sh_155mm_AMOS,          0.1);
    
    CREATE_INCENDIARY_AMMO(Bo_Mk82,                         BombCore,               0.8);
    CREATE_INCENDIARY_AMMO(R_TBG32V_F,                      R_PG32V_F,              0.2);
    
    CREATE_INCENDIARY_AMMO(R_80mm_HE,                       RocketBase,             0.2);
    CREATE_INCENDIARY_AMMO(R_60mm_HE,                       R_80mm_HE,              0.1);
    
    CREATE_INCENDIARY_AMMO(R_230mm_HE,                      SubmunitionBase,        0.9);
    CREATE_INCENDIARY_AMMO(R_230mm_fly,                     ShellBase,              0.9);
    
    CREATE_INCENDIARY_AMMO(G_40mm_HE,                       GrenadeBase,            0.1);
    CREATE_INCENDIARY_AMMO(G_20mm_HE,                       G_40mm_HE,              0.3);
    CREATE_INCENDIARY_AMMO(G_40mm_HEDP,                     G_40mm_HE,              0.8);
    
    CREATE_INCENDIARY_AMMO(Mo_cluster_AP,                   ShellBase,              0.9);
    CREATE_INCENDIARY_AMMO(M_Titan_AT,                      MissileBase,            1.0);
    CREATE_INCENDIARY_AMMO(M_Titan_AP,                      M_Titan_AT,             0.3);
    
    CREATE_INCENDIARY_AMMO(Sh_125mm_APFSDS,                 Sh_120mm_APFSDS,        0.15);
    CREATE_INCENDIARY_AMMO(Sh_125mm_HEAT,                   Sh_125mm_HE,            1.0);
    
    CREATE_INCENDIARY_AMMO(Gatling_30mm_HE_Plane_CAS_01_F,  BulletBase,             0.6);
    
    CREATE_INCENDIARY_AMMO(Missile_AGM_02_F,                MissileBase,            1.0);
    CREATE_INCENDIARY_AMMO(M_Mo_82mm_AT,                    MissileBase,            1.0);
    CREATE_INCENDIARY_AMMO(Rocket_04_HE_F,                  MissileBase,            0.4);
    CREATE_INCENDIARY_AMMO(Rocket_04_AP_F,                  Rocket_04_HE_F,         0.1);
    
    CREATE_INCENDIARY_AMMO(Sh_105mm_HEAT_MP,                Sh_125mm_HEAT,          0.8);
    
    CREATE_INCENDIARY_AMMO(APERSTripMine_Wire_Ammo,         DirectionalBombBase,    0.0);
   
    CREATE_INCENDIARY_AMMO(B_127x54_Ball,                   BulletBase,             0.8);
    CREATE_INCENDIARY_AMMO(B_93x64_Ball,                    BulletBase,             0.5);
    
    CREATE_INCENDIARY_AMMO(M_Vorona_HE,                     M_Vorona_HEAT,          0.2);
    CREATE_INCENDIARY_AMMO(M_SPG9_HE,                       M_SPG9_HEAT,            0.2);
    CREATE_INCENDIARY_AMMO(R_MRAAWS_HE_F,                   R_MRAAWS_HEAT_F,        0.4);
    
    CREATE_INCENDIARY_AMMO(B_20mm_AP,                       BulletBase,             0.2);
};
