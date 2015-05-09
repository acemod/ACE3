class CfgAmmo {
    class ShellBase;
    class BulletBase;

    class ace_fuelexpbig: ShellBase {
        hit=100;
        indirectHit=80;
        indirectHitRange=3;
        soundHit[]={"\a3\sounds_f\Weapons\explosion\expl_big_2.wss", db16,1,1600};
        typicalSpeed = 100;
        explosive = 1;
        cost = 300;
        model = "\A3\Weapons_f\empty";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.001;
        soundFly[] = {"",1,1};
        soundEngine[] = {"",1,4};
        explosionEffects = "VehicleExplosionEffects";
    };
    class ace_fuelexpsmall: ace_fuelexpbig {
        hit=50;
        indirectHit=40;
        indirectHitRange=2;
        soundHit[]={"\a3\sounds_f\SFX\explosion1", db16,1,1600};
        explosionEffects = "ExploAmmoExplosion";
    };
    class ace_fuelexpspark: BulletBase {
        hit=7.5;
        indirectHit=6;
        indirectHitRange=1;
        explosive = 0.1;
        craterEffects = "ImpactEffectsBig";
        explosionEffects = "NoExplosion";    // Need very small explosion FX...
        soundHit[]={"\a3\sounds_f\Weapons\explosion\supersonic_crack_50meters.wss",db16,0.7,100};
        soundCrack1[]={"\a3\sounds_f\Weapons\explosion\supersonic_crack_close.wss",db16,0.6,100};
        soundCrack2[]={"\a3\sounds_f\Weapons\explosion\supersonic_crack_50meters.wss",db16,0.7,100};
        soundCrack3[]={"\a3\sounds_f\Weapons\explosion\supersonic_crack_50meters.wss",db16,0.8,100};

        hitGroundSoft[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitGroundHard[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitMan[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitArmor[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitIron[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitBuilding[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitFoliage[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitWood[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitGlass[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitGlassArmored[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitConcrete[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitRubber[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitPlastic[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitDefault[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitMetal[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
        hitMetalplate[] = {"soundCrack1",0.33,"soundCrack2",0.34,"soundCrack3",0.33};
    };
    
    class ACE_cookoff_large_1_normal : ShellBase {
        hit = 1;
        indirectHit = 20;
        indirectHitRange = 2;
        typicalSpeed = 100;
        explosive = 1;
        cost = 300;
        model = "\A3\Weapons_f\empty";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.0001;
        soundFly[] = {"",1,1};
        soundEngine[] = {"",1,4};
        CraterEffects = "ExploAmmoCrater";
        explosionEffects = "ExploAmmoExplosion";
        muzzleEffect = "BIS_fnc_EffectRifle";
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.23413,1,1800};
        soundDefault1[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.2341,1,1800};
        hitGroundSoft[] = {"soundDefault1",1};
        hitGroundHard[] = {"soundDefault1",1};
        hitMan[] = {"soundDefault1",1};
        hitArmor[] = {"soundDefault1",1};
        hitIron[] = {"soundDefault1",1};
        hitBuilding[] = {"soundDefault1",1};
        hitFoliage[] = {"soundDefault1",1};
        hitWood[] = {"soundDefault1",1};
        hitGlass[] = {"soundDefault1",1};
        hitGlassArmored[] = {"soundDefault1",1};
        hitConcrete[] = {"soundDefault1",1};
        hitRubber[] = {"soundDefault1",1};
        hitPlastic[] = {"soundDefault1",1};
        hitDefault[] = {"soundDefault1",1};
        hitMetal[] = {"soundDefault1",1};
        hitMetalplate[] = {"soundDefault1",1};
    };
    
    class ACE_cookoff_large_1_filtered: ACE_cookoff_large_1_normal {
        CraterEffects = "";
        explosionEffects = "";
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close_filtered.wss), 56.23413,1.2,1800};
        soundDefault1[] = {PATHTOF(data\sounds\cannon_crack_close_filtered.wss), 56.2341,1.2,1800};
    };
    
    class ACE_cookoff_large_2_normal: ACE_cookoff_large_1_normal {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.23413,1.2,1800};
        soundDefault1[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.2341,1.2,1800};
    };
    
    class ACE_cookoff_large_2_filtered: ACE_cookoff_large_1_filtered {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close_filtered.wss), 56.23413,1.2,1800};
        soundDefault1[] = {PATHTOF(data\sounds\cannon_crack_close_filtered.wss), 56.2341,1.2,1800};
    };
    
    class ACE_cookoff_large_3_normal: ACE_cookoff_large_1_normal {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.23413,0.9,1800};
        soundDefault1[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.2341,0.9,1800};
    };
    
    class ACE_cookoff_large_3_filtered: ACE_cookoff_large_1_filtered {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close_filtered), 56.23413,0.9,1800};
        soundDefault1[] = {PATHTOF(data\sounds\cannon_crack_close_filtered), 56.2341,0.9,1800};
    };
    
    class ACE_cookoff_small_1_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close.wss), 56.23413,1,1800};
        soundDefault1[] = {PATHTOF(data\sounds\heavy_crack_close.wss), 56.2341,1,1800};
    };
    
    class ACE_cookoff_small_1_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close_filtered.wss), 56.23413,1,1800};
        soundDefault1[] = {PATHTOF(data\sounds\heavy_crack_close_filtered.wss), 56.2341,1,1800};
    };
    
    class ACE_cookoff_small_2_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close.wss), 56.23413,1,1800};
        soundDefault1[] = {PATHTOF(data\sounds\light_crack_close.wss), 56.2341,1,1800};
    };
    
    class ACE_cookoff_small_2_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close_filtered.wss), 56.23413,1,1800};
        soundDefault1[] = {PATHTOF(data\sounds\light_crack_close_filtered.wss), 56.2341,1,1800};
    };
    
    class ACE_cookoff_small_3_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close.wss), 56.23413,1.2,1800};
        soundDefault1[] = {PATHTOF(data\sounds\heavy_crack_close.wss), 56.2341,1.2,1800};
    };
    
    class ACE_cookoff_small_3_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close_filtered.wss), 56.23413,1.2,1800};
        soundDefault1[] = {PATHTOF(data\sounds\heavy_crack_close_filtered.wss), 56.2341,1.2,1800};
    };
    
    class ACE_cookoff_small_4_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close.wss), 56.23413,1.5,1800};
        soundDefault1[] = {PATHTOF(data\sounds\light_crack_close.wss), 56.2341,1.5,1800};
    };
    
    class ACE_cookoff_small_4_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close_filtered.wss), 56.23413,1.5,1800};
        soundDefault1[] = {PATHTOF(data\sounds\light_crack_close_filtered.wss), 56.2341,1.5,1800};
    };
};
