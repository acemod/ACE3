class CfgAmmo {
    
    class Grenade;
    
    class ACE_FlashlightProxy_White: Grenade {
        effectsSmoke = "ACE_FlashlightEffect_White";
        explosionTime = 0.01;
        grenadeBurningSound[] = {};
        grenadeFireSound[] = {};
        hit = 0;
        model = "\A3\Weapons_f\empty.p3d";
        simulation = "shotSmokeX";
        smokeColor[] = {1,1,1,1};
        timeToLive = 1e10;
        
        impactArmor[] = {};
        impactConcrete[] = {};
        impactDefault[] = {};
        impactGlass[] = {};
        impactGlassArmored[] = {};
        impactGroundHard[] = {};
        impactGroundSoft[] = {};
        impactIron[] = {};
        impactMan[] = {};
        impactMetal[] = {};
        impactMetalPlate[] = {};
        impactMetalPlastic[] = {};
        impactRubber[] = {};
        impactTyre[] = {};
        impactWater[] = {};
        impactWood[] = {};
    };
    
    class ACE_FlashlightProxy_Red: ACE_FlashlightProxy_White {
        effectsSmoke = "ACE_FlashlightEffect_Red";
    };
    
    class ACE_FlashlightProxy_Blue: ACE_FlashlightProxy_White {
        effectsSmoke = "ACE_FlashlightEffect_Blue";
    };
    
    class ACE_FlashlightProxy_Green: ACE_FlashlightProxy_White {
        effectsSmoke = "ACE_FlashlightEffect_Green";
    };
    
    class ACE_FlashlightProxy_Yellow: ACE_FlashlightProxy_White {
        effectsSmoke = "ACE_FlashlightEffect_Yellow";
    };
    
    class ACE_FlashlightProxy_Orange: ACE_FlashlightProxy_White {
        effectsSmoke = "ACE_FlashlightEffect_Orange";
    };
};