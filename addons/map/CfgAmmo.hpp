class CfgAmmo {

    class FlareCore;
    
    class FlareBase: FlareCore {};
    class F_20mm_White: FlareBase {};
    
    class ACE_FlashlightProxy_White: F_20mm_White {
        model = "\A3\Weapons_f\empty";
        effectFlare = "FlareShell";
        
        triggerTime = 0;
        intensity = 0.5;
        flareSize = 1;
        timeToLive = 10e10;
        
        lightColor[] = {1,1,1,1};
        
        grenadeBurningSound[] = {};
        grenadeFireSound[] = {};
        soundTrigger[] = {};
        SmokeShellSoundHit1[] = {};
        SmokeShellSoundHit2[] = {};
        SmokeShellSoundHit3[] = {};
        SmokeShellSoundLoop1[] = {};
        SmokeShellSoundLoop2[] = {};
    };
    
    class ACE_FlashlightProxy_Red: ACE_FlashlightProxy_White {
        intensity = 1;
        lightColor[] = {1,0,0,1};
    };
    
    class ACE_FlashlightProxy_Green: ACE_FlashlightProxy_White {
        intensity = 1;
        lightColor[] = {0,1,0,1};
    };
    
    class ACE_FlashlightProxy_Blue: ACE_FlashlightProxy_White {
        intensity = 1.5;
        lightColor[] = {0.25,0.25,1,1};
    };
    
    class ACE_FlashlightProxy_Yellow: ACE_FlashlightProxy_White {
        intensity = 1;
        lightColor[] = {1,1,0.5,1};
    };
};