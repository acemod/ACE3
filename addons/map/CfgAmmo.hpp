class CfgAmmo {
    
    class Chemlight_base;
    
    class ACE_FlashlightProxy_White: Chemlight_base {
        model = "\A3\Weapons_f\empty";
        effectsSmoke = "ACE_FlashlightEffect_White";
        explosionTime = 0.01;
        timeToLive = 1e10;
        
        soundImpactHard1[] = {"",1,1};
        soundImpactHard2[] = {"",1,1};
        soundImpactHard3[] = {"",1,1};
        soundImpactHard4[] = {"",1,1};
        soundImpactHard5[] = {"",1,1};
        soundImpactHard6[] = {"",1,1};
        soundImpactHard7[] = {"",1,1};
        soundImpactIron1[] = {"",1,1};
        soundImpactIron2[] = {"",1,1};
        soundImpactIron3[] = {"",1,1};
        soundImpactIron4[] = {"",1,1};
        soundImpactIron5[] = {"",1,1};
        soundImpactSoft1[] = {"",1,1};
        soundImpactSoft2[] = {"",1,1};
        soundImpactSoft3[] = {"",1,1};
        soundImpactSoft4[] = {"",1,1};
        soundImpactSoft5[] = {"",1,1};
        soundImpactSoft6[] = {"",1,1};
        soundImpactSoft7[] = {"",1,1};
        soundImpactWater1[] = {"",1,1};
        soundImpactWater2[] = {"",1,1};
        soundImpactWater3[] = {"",1,1};
        soundImpactWoodExt1[] = {"",1,1};
        soundImpactWoodExt2[] = {"",1,1};
        soundImpactWoodExt3[] = {"",1,1};
        soundImpactWoodExt4[] = {"",1,1};
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
};