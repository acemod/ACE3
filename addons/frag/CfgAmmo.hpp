#define BASE_DRAG         -0.01
#define HD_MULT            5
#define BASE_DRAG_HD    (BASE_DRAG*HD_MULT)

class CfgAmmo {
    //class ace_arty_105mm_m1_m782_time;
    //class ace_arty_105mm_m1_m782_prox: ace_arty_105mm_m1_m782_time {};
    //class ace_arty_105mm_m1_m782_delay: ace_arty_105mm_m1_m782_prox {
    //    GVAR(skip) = 1;
    //};
    
    class Bo_GBU12_LGB;
    class ACE_GBU12 : Bo_GBU12_LGB {
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_large", "ACE_frag_large", "ACE_frag_large_HD", "ACE_frag_large", "ACE_frag_huge", "ACE_frag_huge_HD", "ACE_frag_huge"};
        GVAR(metal) = 140000;
        GVAR(charge) = 87000;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
        sideAirFriction = 0.04;
        airFriction = 0.04;
        laserLock = 0;
    };

    class GrenadeBase;
    class Grenade;
    class GrenadeHand: Grenade {
        GVAR(enabled) = 1;
        
        GVAR(skip) = 0;
        GVAR(force) = 1;
        // This is a good high-drag frag type for grenades.
        GVAR(classes)[] = {"ACE_frag_tiny_HD"};
        /*
        These values are based on the M67 Grenade, should be tweaked for
        individual grenades.
        */
        GVAR(metal) = 210;         // metal in grams
        GVAR(charge) = 185;        // explosive in grams
        GVAR(gurney_c) = 2843;    // Gurney velocity constant for explosive type. See: http://en.wikipedia.org/wiki/Gurney_equations
        GVAR(gurney_k) = 3/5;    // Gurney shape factor, in this case a sphere. See: http://en.wikipedia.org/wiki/Gurney_equations
    };
    class GrenadeHand_stone: GrenadeHand {
        GVAR(skip) = 1;
    };
    class SmokeShell: GrenadeHand {
        GVAR(skip) = 1;
    };

    class RocketBase;
    class R_Hydra_HE: RocketBase {
        // Source: http://fas.org/man/dod-101/sys/missile/hydra-70.htm
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 3850;
        GVAR(charge) = 1040;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    //class R_57mm_HE: RocketBase {
    //    GVAR(skip) = 1;
    //};

    class R_80mm_HE: RocketBase {
        GVAR(skip) = 1;
    };

    //class R_S8T_AT: RocketBase {
    //    GVAR(skip) = 1;
    //};

    class BombCore;
    class Bo_Mk82: BombCore {
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_large", "ACE_frag_large", "ACE_frag_large_HD", "ACE_frag_large", "ACE_frag_huge", "ACE_frag_huge_HD", "ACE_frag_huge"};
        GVAR(metal) = 140000;
        GVAR(charge) = 87000;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };
    
    class G_40mm_HE: GrenadeBase {
        // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M441
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_tiny_HD"};
        GVAR(metal) = 200;
        GVAR(charge) = 32;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class G_40mm_HEDP: G_40mm_HE {
        // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M433
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_tiny_HD"};
        GVAR(metal) = 200;
        GVAR(charge) = 45;
        GVAR(gurney_c) = 2830;
        GVAR(gurney_k) = 1/2;
    };
    
    class ACE_G_40mm_HEDP: G_40mm_HEDP {
    };
    class ACE_G_40mm_HE: G_40mm_HE {
    };
    class ACE_G_40mm_Practice: ACE_G_40mm_HE {
        GVAR(skip) = 1;
    };
    class ACE_G40mm_HE_VOG25P: G_40mm_HE {
        GVAR(skip) = 0;
        GVAR(force) = 1;
    };

    // curator ammo entries
    class ShellBase;
    class Sh_125mm_HEAT;
    class Sh_155mm_AMOS: ShellBase {
        // Source: http://www.globalsecurity.org/military/systems/munitions/m795.htm
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_large", "ACE_frag_large", "ACE_frag_large_HD", "ACE_frag_large", "ACE_frag_huge", "ACE_frag_huge_HD", "ACE_frag_huge"};
        GVAR(metal) = 36000;
        GVAR(charge) = 9979;
        GVAR(gurney_c) = 2440;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_82mm_AMOS : Sh_155mm_AMOS {
        // Source: http://www.arsenal-bg.com/defense_police/mortar_bombs_82mm.htm
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 3200;
        GVAR(charge) = 420;
        GVAR(gurney_c) = 2440;
        GVAR(gurney_k) = 1/2;
    };
    class ModuleOrdnanceMortar_F_Ammo: Sh_82mm_AMOS {
        GVAR(enabled) = 1;
    
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 800;
        GVAR(charge) = 4200;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_105mm_HEAT_MP : Sh_125mm_HEAT {
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 11400;
        GVAR(charge) = 7100;
        GVAR(gurney_c) = 2800;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_120mm_HE : ShellBase {
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 23000;
        GVAR(charge) = 3148;
        GVAR(gurney_c) = 2830;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_125mm_HE: Sh_120mm_HE {
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 16000;
        GVAR(charge) = 3200;
        GVAR(gurney_c) = 2440;
        GVAR(gurney_k) = 1/2;
    };
    class ModuleOrdnanceHowitzer_F_ammo: Sh_155mm_AMOS {
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_large", "ACE_frag_large", "ACE_frag_large_HD", "ACE_frag_large", "ACE_frag_huge", "ACE_frag_huge_HD", "ACE_frag_huge"};
        GVAR(metal) = 1950;
        GVAR(charge) = 15800;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };

    //class R_230mm_HE;
    //class ModuleOrdnanceRocket_F_ammo: R_230mm_HE {
    //};

    //class R_230mm_fly;
    //class ModuleOrdnanceRocket_F_subammo: R_230mm_fly {
    //};
    // end of curator ammo entries

    //class R_SMAW_HEDP;
    //class R_MEEWS_HEDP : R_SMAW_HEDP {
    //    GVAR(force) = 1;
    //    GVAR(multiplier) = 1.2;
    //};

    class MissileBase;
    class Missile_AGM_02_F : MissileBase {
        // Source: http://fas.org/man/dod-101/sys/smart/agm-65.htm
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 56250;
        GVAR(charge) = 39000;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class M_Hellfire_AT: MissileBase {
        // Source: http://www.designation-systems.net/dusrm/m-114.html
        GVAR(enabled) = 1;
        
        GVAR(classes)[] = {"ACE_frag_medium", "ACE_frag_medium_HD"};
        GVAR(metal) = 8000;
        GVAR(charge) = 2400;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };

    /*
    class B_762x51_Ball;
    class ACE_frag_base: B_762x51_Ball { ////TODO: B_762x45_Ball no longer exists, is this a valid replacement?
        model = "\A3\Weapons_f\ammo\shell";
        timeToLive = 12;
        typicalSpeed = 800;
        // Fix sounds
        effectFly = "AmmoClassic";
        soundDefault1[] = {"A3\sounds_f\weapons\hits\concrete_1.wav",0.158114,1,30};
        soundDefault2[] = {"A3\sounds_f\weapons\hits\concrete_2.wav",0.158114,1,30};
        soundDefault3[] = {"A3\sounds_f\weapons\hits\concrete_3.wav",0.158114,1,30};
        soundDefault4[] = {"A3\sounds_f\weapons\hits\concrete_4.wav",0.158114,1,30};
        soundDefault5[] = {"A3\sounds_f\weapons\hits\concrete_5.wav",0.158114,1,30};
        soundDefault6[] = {"A3\sounds_f\weapons\hits\concrete_6.wav",0.158114,1,30};
        soundDefault7[] = {"A3\sounds_f\weapons\hits\concrete_7.wav",0.158114,1,30};
        soundDefault8[] = {"A3\sounds_f\weapons\hits\concrete_8.wav",0.158114,1,30};
        soundGroundSoft1[] = {"A3\sounds_f\weapons\hits\soft_ground_1.wav",0.02811705,1,30};
        soundGroundSoft2[] = {"A3\sounds_f\weapons\hits\soft_ground_2.wav",0.02811705,1,30};
        soundGroundSoft3[] = {"A3\sounds_f\weapons\hits\soft_ground_3.wav",0.02811705,1,30};
        soundGroundSoft4[] = {"A3\sounds_f\weapons\hits\soft_ground_4.wav",0.02811705,1,30};
        soundGroundSoft5[] = {"A3\sounds_f\weapons\hits\soft_ground_5.wav",0.02811705,1,30};
        soundGroundSoft6[] = {"A3\sounds_f\weapons\hits\soft_ground_6.wav",0.02811705,1,30};
        soundGroundSoft7[] = {"A3\sounds_f\weapons\hits\soft_ground_7.wav",0.02811705,1,30};
        soundGroundSoft8[] = {"A3\sounds_f\weapons\hits\soft_ground_8.wav",0.02811705,1,30};
        soundGroundHard1[] = {"A3\sounds_f\weapons\hits\hard_ground_1.wav",0.62946,1,40};
        soundGroundHard2[] = {"A3\sounds_f\weapons\hits\hard_ground_2.wav",0.62946,1,40};
        soundGroundHard3[] = {"A3\sounds_f\weapons\hits\hard_ground_3.wav",0.62946,1,40};
        soundGroundHard4[] = {"A3\sounds_f\weapons\hits\hard_ground_4.wav",0.62946,1,40};
        soundGroundHard5[] = {"A3\sounds_f\weapons\hits\hard_ground_5.wav",0.62946,1,40};
        soundGroundHard6[] = {"A3\sounds_f\weapons\hits\hard_ground_6.wav",0.62946,1,40};
        soundGroundHard7[] = {"A3\sounds_f\weapons\hits\hard_ground_7.wav",0.62946,1,40};
        soundGroundHard8[] = {"A3\sounds_f\weapons\hits\hard_ground_8.wav",0.62946,1,40};
        soundMetal1[] = {"A3\sounds_f\weapons\hits\metal_1.wav",0.158114,1,45};
        soundMetal2[] = {"A3\sounds_f\weapons\hits\metal_2.wav",0.158114,1,45};
        soundMetal3[] = {"A3\sounds_f\weapons\hits\metal_3.wav",0.158114,1,45};
        soundMetal4[] = {"A3\sounds_f\weapons\hits\metal_4.wav",0.158114,1,45};
        soundMetal5[] = {"A3\sounds_f\weapons\hits\metal_5.wav",0.158114,1,45};
        soundMetal6[] = {"A3\sounds_f\weapons\hits\metal_6.wav",0.158114,1,45};
        soundMetal7[] = {"A3\sounds_f\weapons\hits\metal_7.wav",0.158114,1,45};
        soundMetal8[] = {"A3\sounds_f\weapons\hits\metal_8.wav",0.158114,1,45};
        soundGlass1[] = {"A3\sounds_f\weapons\hits\glass_1.wav",0.177828,1,25};
        soundGlass2[] = {"A3\sounds_f\weapons\hits\glass_2.wav",0.177828,1,25};
        soundGlass3[] = {"A3\sounds_f\weapons\hits\glass_3.wav",0.177828,1,25};
        soundGlass4[] = {"A3\sounds_f\weapons\hits\glass_4.wav",0.177828,1,25};
        soundGlass5[] = {"A3\sounds_f\weapons\hits\glass_5.wav",0.177828,1,25};
        soundGlass6[] = {"A3\sounds_f\weapons\hits\glass_6.wav",0.177828,1,25};
        soundGlass7[] = {"A3\sounds_f\weapons\hits\glass_7.wav",0.177828,1,25};
        soundGlass8[] = {"A3\sounds_f\weapons\hits\glass_8.wav",0.177828,1,25};
        soundGlassArmored1[] = {"A3\sounds_f\weapons\hits\glass_arm_1.wav",0.177828,1,30};
        soundGlassArmored2[] = {"A3\sounds_f\weapons\hits\glass_arm_2.wav",0.177828,1,30};
        soundGlassArmored3[] = {"A3\sounds_f\weapons\hits\glass_arm_3.wav",0.177828,1,30};
        soundGlassArmored4[] = {"A3\sounds_f\weapons\hits\glass_arm_4.wav",0.177828,1,30};
        soundGlassArmored5[] = {"A3\sounds_f\weapons\hits\glass_arm_5.wav",0.177828,1,30};
        soundGlassArmored6[] = {"A3\sounds_f\weapons\hits\glass_arm_6.wav",0.177828,1,30};
        soundGlassArmored7[] = {"A3\sounds_f\weapons\hits\glass_arm_7.wav",0.177828,1,30};
        soundGlassArmored8[] = {"A3\sounds_f\weapons\hits\glass_arm_8.wav",0.177828,1,30};
        soundVehiclePlate1[] = {"A3\sounds_f\weapons\hits\metal_plate_1.wav",0.281170,1,40};
        soundVehiclePlate2[] = {"A3\sounds_f\weapons\hits\metal_plate_2.wav",0.281170,1,40};
        soundVehiclePlate3[] = {"A3\sounds_f\weapons\hits\metal_plate_3.wav",0.281170,1,40};
        soundVehiclePlate4[] = {"A3\sounds_f\weapons\hits\metal_plate_4.wav",0.281170,1,40};
        soundVehiclePlate5[] = {"A3\sounds_f\weapons\hits\metal_plate_5.wav",0.281170,1,40};
        soundVehiclePlate6[] = {"A3\sounds_f\weapons\hits\metal_plate_6.wav",0.281170,1,40};
        soundVehiclePlate7[] = {"A3\sounds_f\weapons\hits\metal_plate_7.wav",0.281170,1,40};
        soundVehiclePlate8[] = {"A3\sounds_f\weapons\hits\metal_plate_8.wav",0.281170,1,40};
        soundWood1[] = {"A3\sounds_f\weapons\hits\wood_1.wav",0.158114,1,30};
        soundWood2[] = {"A3\sounds_f\weapons\hits\wood_2.wav",0.158114,1,30};
        soundWood3[] = {"A3\sounds_f\weapons\hits\wood_3.wav",0.158114,1,30};
        soundWood4[] = {"A3\sounds_f\weapons\hits\wood_4.wav",0.158114,1,30};
        soundWood5[] = {"A3\sounds_f\weapons\hits\wood_5.wav",0.158114,1,30};
        soundWood6[] = {"A3\sounds_f\weapons\hits\wood_6.wav",0.158114,1,30};
        soundWood7[] = {"A3\sounds_f\weapons\hits\wood_7.wav",0.158114,1,30};
        soundWood8[] = {"A3\sounds_f\weapons\hits\wood_8.wav",0.158114,1,30};
        soundHitBody1[] = {"A3\sounds_f\weapons\hits\body_1.wav",0.0177828,1,25};
        soundHitBody2[] = {"A3\sounds_f\weapons\hits\body_2.wav",0.0177828,1,25};
        soundHitBody3[] = {"A3\sounds_f\weapons\hits\body_3.wav",0.0177828,1,25};
        soundHitBody4[] = {"A3\sounds_f\weapons\hits\body_4.wav",0.0177828,1,25};
        soundHitBody5[] = {"A3\sounds_f\weapons\hits\body_5.wav",0.0177828,1,25};
        soundHitBody6[] = {"A3\sounds_f\weapons\hits\body_6.wav",0.0177828,1,25};
        soundHitBody7[] = {"A3\sounds_f\weapons\hits\body_7.wav",0.0177828,1,25};
        soundHitBody8[] = {"A3\sounds_f\weapons\hits\body_8.wav",0.0177828,1,25};
        soundHitBuilding1[] = {"A3\sounds_f\weapons\hits\building_1.wav",0.251189,1,30};
        soundHitBuilding2[] = {"A3\sounds_f\weapons\hits\building_2.wav",0.251189,1,30};
        soundHitBuilding3[] = {"A3\sounds_f\weapons\hits\building_3.wav",0.251189,1,30};
        soundHitBuilding4[] = {"A3\sounds_f\weapons\hits\building_4.wav",0.251189,1,30};
        soundHitBuilding5[] = {"A3\sounds_f\weapons\hits\building_5.wav",0.251189,1,30};
        soundHitBuilding6[] = {"A3\sounds_f\weapons\hits\building_6.wav",0.251189,1,30};
        soundHitBuilding7[] = {"A3\sounds_f\weapons\hits\building_7.wav",0.251189,1,30};
        soundHitBuilding8[] = {"A3\sounds_f\weapons\hits\building_8.wav",0.251189,1,30};
        soundHitFoliage1[] = {"A3\sounds_f\weapons\hits\foliage_1.wav",0.177828,1,25};
        soundHitFoliage2[] = {"A3\sounds_f\weapons\hits\foliage_2.wav",0.177828,1,25};
        soundHitFoliage3[] = {"A3\sounds_f\weapons\hits\foliage_3.wav",0.177828,1,25};
        soundHitFoliage4[] = {"A3\sounds_f\weapons\hits\foliage_4.wav",0.177828,1,25};
        soundHitFoliage5[] = {"A3\sounds_f\weapons\hits\foliage_5.wav",0.177828,1,25};
        soundHitFoliage6[] = {"A3\sounds_f\weapons\hits\foliage_6.wav",0.177828,1,25};
        soundHitFoliage7[] = {"A3\sounds_f\weapons\hits\foliage_7.wav",0.177828,1,25};
        soundHitFoliage8[] = {"A3\sounds_f\weapons\hits\foliage_8.wav",0.177828,1,25};
        soundPlastic1[] = {"A3\sounds_f\weapons\hits\plastic_1.wav",0.177828,1,25};
        soundPlastic2[] = {"A3\sounds_f\weapons\hits\plastic_2.wav",0.177828,1,25};
        soundPlastic3[] = {"A3\sounds_f\weapons\hits\plastic_3.wav",0.177828,1,25};
        soundPlastic4[] = {"A3\sounds_f\weapons\hits\plastic_4.wav",0.177828,1,25};
        soundPlastic5[] = {"A3\sounds_f\weapons\hits\plastic_5.wav",0.177828,1,25};
        soundPlastic6[] = {"A3\sounds_f\weapons\hits\plastic_6.wav",0.177828,1,25};
        soundPlastic7[] = {"A3\sounds_f\weapons\hits\plastic_7.wav",0.177828,1,25};
        soundPlastic8[] = {"A3\sounds_f\weapons\hits\plastic_8.wav",0.177828,1,25};
        soundConcrete1[] = {"A3\sounds_f\weapons\hits\concrete_1.wav",0.177828,1,35};
        soundConcrete2[] = {"A3\sounds_f\weapons\hits\concrete_2.wav",0.177828,1,35};
        soundConcrete3[] = {"A3\sounds_f\weapons\hits\concrete_3.wav",0.177828,1,35};
        soundConcrete4[] = {"A3\sounds_f\weapons\hits\concrete_4.wav",0.177828,1,35};
        soundConcrete5[] = {"A3\sounds_f\weapons\hits\concrete_5.wav",0.177828,1,35};
        soundConcrete6[] = {"A3\sounds_f\weapons\hits\concrete_6.wav",0.177828,1,35};
        soundConcrete7[] = {"A3\sounds_f\weapons\hits\concrete_7.wav",0.177828,1,35};
        soundConcrete8[] = {"A3\sounds_f\weapons\hits\concrete_8.wav",0.177828,1,35};
        soundRubber1[] = {"A3\sounds_f\weapons\hits\tyre_1.wav",0.158114,1,25};
        soundRubber2[] = {"A3\sounds_f\weapons\hits\tyre_2.wav",0.158114,1,25};
        soundRubber3[] = {"A3\sounds_f\weapons\hits\tyre_3.wav",0.158114,1,25};
        soundRubber4[] = {"A3\sounds_f\weapons\hits\tyre_4.wav",0.158114,1,25};
        soundRubber5[] = {"A3\sounds_f\weapons\hits\tyre_5.wav",0.158114,1,25};
        soundRubber6[] = {"A3\sounds_f\weapons\hits\tyre_6.wav",0.158114,1,25};
        soundRubber7[] = {"A3\sounds_f\weapons\hits\tyre_7.wav",0.158114,1,25};
        soundRubber8[] = {"A3\sounds_f\weapons\hits\tyre_8.wav",0.158114,1,25};
        soundWater1[] = {"A3\sounds_f\weapons\hits\water_01.wav",0.158114,1,25};
        soundWater2[] = {"A3\sounds_f\weapons\hits\water_02.wav",0.158114,1,25};
        soundWater3[] = {"A3\sounds_f\weapons\hits\water_03.wav",0.158114,1,25};
        soundWater4[] = {"A3\sounds_f\weapons\hits\water_04.wav",0.158114,1,25};
        soundWater5[] = {"A3\sounds_f\weapons\hits\water_05.wav",0.158114,1,25};
        soundWater6[] = {"A3\sounds_f\weapons\hits\water_06.wav",0.158114,1,25};
        soundWater7[] = {"A3\sounds_f\weapons\hits\water_07.wav",0.158114,1,25};
        soundWater8[] = {"A3\sounds_f\weapons\hits\water_08.wav",0.158114,1,25};
        hitGroundSoft[] = {"soundGroundSoft1",0.2,"soundGroundSoft2",0.2,"soundGroundSoft3",0.1,"soundGroundSoft4",0.1,"soundGroundSoft5",0.1,"soundGroundSoft6",0.1,"soundGroundSoft7",0.1,"soundGroundSoft8",0.1};
        hitGroundHard[] = {"soundGroundHard1",0.2,"soundGroundHard2",0.2,"soundGroundHard3",0.1,"soundGroundHard4",0.1,"soundGroundHard5",0.1,"soundGroundHard6",0.1,"soundGroundHard7",0.1,"soundGroundHard8",0.1};
        hitMan[] = {"soundHitBody1",0.125,"soundHitBody2",0.125,"soundHitBody3",0.125,"soundHitBody4",0.125,"soundHitBody5",0.125,"soundHitBody6",0.125,"soundHitBody7",0.125,"soundHitBody8",0.125};
        hitArmor[] = {"soundVehiclePlate1",0.125,"soundVehiclePlate2",0.125,"soundVehiclePlate3",0.125,"soundVehiclePlate4",0.125,"soundVehiclePlate5",0.125,"soundVehiclePlate6",0.125,"soundVehiclePlate7",0.125,"soundVehiclePlate8",0.125};
        hitBuilding[] = {"soundHitBuilding1",0.2,"soundHitBuilding2",0.2,"soundHitBuilding3",0.1,"soundHitBuilding4",0.1,"soundHitBuilding5",0.1,"soundHitBuilding6",0.1,"soundHitBuilding7",0.1,"soundHitBuilding8",0.1};
        hitFoliage[] = {"soundHitFoliage1",0.125,"soundHitFoliage2",0.125,"soundHitFoliage3",0.125,"soundHitFoliage4",0.125,"soundHitFoliage5",0.125,"soundHitFoliage6",0.125,"soundHitFoliage7",0.125,"soundHitFoliage8",0.125};
        hitWood[] = {"soundWood1",0.125,"soundWood2",0.125,"soundWood3",0.125,"soundWood4",0.125,"soundWood5",0.125,"soundWood6",0.125,"soundWood7",0.125,"soundWood8",0.125};
        hitGlass[] = {"soundGlass1",0.125,"soundGlass2",0.125,"soundGlass3",0.125,"soundGlass4",0.125,"soundGlass5",0.125,"soundGlass6",0.125,"soundGlass7",0.125,"soundGlass8",0.125};
        hitGlassArmored[] = {"soundGlassArmored1",0.125,"soundGlassArmored2",0.125,"soundGlassArmored3",0.125,"soundGlassArmored4",0.125,"soundGlassArmored5",0.125,"soundGlassArmored6",0.125,"soundGlassArmored7",0.125,"soundGlassArmored8",0.125};
        hitConcrete[] = {"soundConcrete1",0.125,"soundConcrete2",0.125,"soundConcrete3",0.125,"soundConcrete4",0.125,"soundConcrete5",0.125,"soundConcrete6",0.125,"soundConcrete7",0.125,"soundConcrete8",0.125};
        hitRubber[] = {"soundRubber1",0.125,"soundRubber2",0.125,"soundRubber3",0.125,"soundRubber4",0.125,"soundRubber5",0.125,"soundRubber6",0.125,"soundRubber7",0.125,"soundRubber8",0.125};
        hitPlastic[] = {"soundPlastic1",0.125,"soundPlastic2",0.125,"soundPlastic3",0.125,"soundPlastic4",0.125,"soundPlastic5",0.125,"soundPlastic6",0.125,"soundPlastic7",0.125,"soundPlastic8",0.125};
        hitDefault[] = {"soundDefault1",0.2,"soundDefault2",0.2,"soundDefault3",0.1,"soundDefault4",0.1,"soundDefault5",0.1,"soundDefault6",0.1,"soundDefault7",0.1,"soundDefault8",0.1};
        hitMetal[] = {"soundMetal1",0.125,"soundMetal2",0.125,"soundMetal3",0.125,"soundMetal4",0.125,"soundMetal5",0.125,"soundMetal6",0.125,"soundMetal7",0.125,"soundMetal8",0.125};
        hitMetalplate[] = {"soundVehiclePlate1",0.125,"soundVehiclePlate2",0.125,"soundVehiclePlate3",0.125,"soundVehiclePlate4",0.125,"soundVehiclePlate5",0.125,"soundVehiclePlate6",0.125,"soundVehiclePlate7",0.125,"soundVehiclePlate8",0.125};
        hitWater[] = {"soundWater1",0.125,"soundWater2",0.125,"soundWater3",0.125,"soundWater4",0.125,"soundWater5",0.125,"soundWater6",0.125,"soundWater7",0.125,"soundWater8",0.125};
        bulletFly1[] = {"A3\sounds_f\weapons\hits\bullet_by_1.wav",1,1,35};
        bulletFly2[] = {"A3\sounds_f\weapons\hits\bullet_by_2.wav",1,1,35};
        bulletFly3[] = {"A3\sounds_f\weapons\hits\bullet_by_3.wav",1,1,35};
        bulletFly4[] = {"A3\sounds_f\weapons\hits\bullet_by_4.wav",1,1,35};
        bulletFly5[] = {"A3\sounds_f\weapons\hits\bullet_by_5.wav",1,1,35};
        bulletFly6[] = {"A3\sounds_f\weapons\hits\bullet_by_6.wav",1,1,35};
        bulletFly7[] = {"A3\sounds_f\weapons\hits\bullet_by_7.wav",1,1,35};
        bulletFly8[] = {"A3\sounds_f\weapons\hits\bullet_by_8.wav",1,1,35};
        bulletFly[] = {"bulletFly1",0.166,"bulletFly2",0.166,"bulletFly3",0.166,"bulletFly4",0.166,"bulletFly5",0.166,"bulletFly6",0.167,"bulletFly7",0.166,"bulletFly8",0.167};
        supersonicCrackNear[] = {"A3\sounds_f\weapons\hits\sscrack1.wav",1,1,35};
        supersonicCrackFar[] = {"A3\sounds_f\weapons\hits\sscrack2.wav",1,1,135};
    };
    */

    class B_65x39_Caseless;
    class ACE_frag_base: B_65x39_Caseless {
        timeToLive = 12;
        typicalSpeed = 1500;
        deflecting = 65;
    };

    class ACE_frag_tiny: ACE_frag_base {
        hit = 6;
        airFriction = BASE_DRAG;
        caliber = 0.75;
    };

    class ACE_frag_tiny_HD: ACE_frag_base {
        hit = 6;
        airFriction = BASE_DRAG_HD;
        caliber = 0.75;
    };

    class ACE_frag_small: ACE_frag_base {
        hit = 12;
        airFriction = BASE_DRAG*0.9;
    };

    class ACE_frag_small_HD: ACE_frag_base {
        hit = 12;
        airFriction = BASE_DRAG_HD*0.9;
    };

    class ACE_frag_medium: ACE_frag_base {
        hit = 14;
        airFriction = BASE_DRAG*0.75;
        caliber = 1.2;
    };

    class ACE_frag_medium_HD: ACE_frag_base {
        hit = 14;
        airFriction = BASE_DRAG_HD*0.75;
        caliber = 1.2;
    };

    class ACE_frag_large: ACE_frag_base {
        hit = 28;
        indirectHit = 2;
        indirectHitRange = 0.25;
        airFriction = BASE_DRAG*0.65;
        caliber = 2;
        explosive = 0;

    };

    class ACE_frag_large_HD: ACE_frag_large {
        hit =  28;
        indirectHit = 2;
        indirectHitRange = 0.25;
        airFriction = BASE_DRAG_HD*0.65;
        caliber = 2;


    };

    class ACE_frag_huge: ACE_frag_large {
        hit = 40;
        indirectHit = 4;
        indirectHitRange = 0.5;
        airFriction = BASE_DRAG*0.5;
        caliber = 2.8;
    };

    class ACE_frag_huge_HD: ACE_frag_large {
        hit = 40;
        indirectHit = 4;
        indirectHitRange = 0.5;
        airFriction = BASE_DRAG_HD*0.5;
        caliber = 2.8;
    };

    class ACE_frag_spall_small: ACE_frag_small {
        timeToLive = 0.1;
    };

    class ACE_frag_spall_medium: ACE_frag_medium {
        timeToLive = 0.15;
    };

    class ACE_frag_spall_large: ACE_frag_large {
        timeToLive = 0.25;
    };

    class ACE_frag_spall_huge: ACE_frag_huge {
        timeToLive = 0.3;
    };
    
    #include "CfgAmmoReflections.hpp"
};
