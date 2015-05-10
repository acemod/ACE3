class CfgAmmo {
    class Default;
    class ShellBase;
    class BulletBase;
    
    class ace_fuelexpbig: Default {
        hit = 50;
		indirectHit = 75;
		indirectHitRange = 2.5;
		model = "";
		simulation = "";
		cost = 1;
        
        explosionSoundEffect = "DefaultExplosion";
		explosionEffects = "VehicleExplosionEffects";
        
		soundHit1[] = {"A3\Sounds_F\weapons\Explosion\expl_big_1",3.1622777,1,2000};
		soundHit2[] = {"A3\Sounds_F\weapons\Explosion\expl_big_2",3.1622777,1,2000};
		soundHit3[] = {"A3\Sounds_F\weapons\Explosion\expl_big_3",3.1622777,1,2000};
		multiSoundHit[] = {"soundHit1",0.13,"soundHit2",0.13,"soundHit3",0.13};
        
        class CamShakeExplode
		{
			power = "(20*0.2)";
			duration = "((round (20^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((1 + 20^0.5)*8)";
		};
		class CamShakeHit
		{
			power = 20;
			duration = "((round (20^0.25))*0.2 max 0.2)";
			frequency = 20;
			distance = 1;
		};
	};
    class ace_fuelexpsmall: ace_fuelexpbig {
        // @TODO!?
    };
    
    class ace_fuelexpspark: BulletBase {
        hit = 2500;
		indirectHit = 500;
		indirectHitRange = 5;
		typicalSpeed = 100;
		explosive = 1;
		cost = 300;
		model = "\A3\Weapons_f\empty";
		airFriction = 0;
		timeToLive = 1;
		explosionTime = 0.001;
		soundFly[] = {"",1,1};
		soundEngine[] = {"",1,4};
        
        explosionSoundEffect = "DefaultExplosion";
		explosionEffects = "SencondaryExplosion";
		craterEffects = "SecondaryCrater";
        
		soundHit[]={"A3\Sounds_F\weapons\Explosion\supersonic_crack_50meters",0.2238721,1,100};
		multiSoundHit[] = {"soundHit",0.33};
        supersonicCrackNear[] = {"A3\Sounds_F\weapons\Explosion\supersonic_crack_50meters",0.2238721,1,150};
		supersonicCrackFar[] = {"A3\Sounds_F\weapons\Explosion\supersonic_crack_50meters",0.2238721,1,150};
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
		explosionTime = 0.001;
		soundFly[] = {"",1,1};
		soundEngine[] = {"",1,4};
		CraterEffects = "SecondaryCrater";
        explosionEffects = "SencondaryExplosion";
        explosionSoundEffect = "DefaultExplosion";

        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.23413,1,1800};
        multiSoundHit[] = {"soundHit",0.34};
        
        class CamShakeExplode
		{
			power = "(16*0.2)";
			duration = "((round (16^0.5))*0.2 max 0.2)";
			frequency = 20;
			distance = "((3 + 16^0.5)*8)";
		};
    };
    
    class ACE_cookoff_large_1_filtered: ACE_cookoff_large_1_normal {
        CraterEffects = "";
        explosionEffects = "SencondaryExplosion";
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close_filtered.wss), 56.23413,1.2,1800};
    };
    
    class ACE_cookoff_large_2_normal: ACE_cookoff_large_1_normal {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.23413,1.2,1800};
    };
    
    class ACE_cookoff_large_2_filtered: ACE_cookoff_large_1_filtered {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close_filtered.wss), 56.23413,1.2,1800};
    };
    
    class ACE_cookoff_large_3_normal: ACE_cookoff_large_1_normal {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close.wss), 56.23413,0.9,1800};
    };
    
    class ACE_cookoff_large_3_filtered: ACE_cookoff_large_1_filtered {
        soundHit[] = {PATHTOF(data\sounds\cannon_crack_close_filtered), 56.23413,0.9,1800};
    };
    
    class ACE_cookoff_small_1_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;
        explosionEffects = "ImpactEffectsSmall";
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close.wss), 56.23413,1,1800};
    };
    
    class ACE_cookoff_small_1_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close_filtered.wss), 56.23413,1,1800};
    };
    
    class ACE_cookoff_small_2_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close.wss), 56.23413,1,1800};
    };
    
    class ACE_cookoff_small_2_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close_filtered.wss), 56.23413,1,1800};
    };
    
    class ACE_cookoff_small_3_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close.wss), 56.23413,1.2,1800};
    };
    
    class ACE_cookoff_small_3_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\heavy_crack_close_filtered.wss), 56.23413,1.2,1800};
    };
    
    class ACE_cookoff_small_4_normal: ACE_cookoff_large_1_normal {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close.wss), 56.23413,1.5,1800};
    };
    
    class ACE_cookoff_small_4_filtered: ACE_cookoff_large_1_filtered {
        indirectHit = 0;
        indirectHitRange = 0;    
        soundHit[] = {PATHTOF(data\sounds\light_crack_close_filtered.wss), 56.23413,1.5,1800};
    };
};
