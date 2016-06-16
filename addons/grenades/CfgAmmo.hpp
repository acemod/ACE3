
class CfgAmmo {
    class Default;
    class Grenade: Default {
        GVAR(pullPinSound)[] = {"A3\sounds_f\weapons\grenades\Grenade_PullPin.wss", 1.5, 1, 10};
        impactGroundSoft[] = {};
    };
    
    class FlareCore;
    class FlareBase: FlareCore {
        intensity = 20000;
        flareSize = 12;
        timeToLive = 60;
    };

    class F_40mm_White: FlareBase {
        intensity = 40000;
        flareSize = 12;
    };

    class F_20mm_White: FlareBase {
        intensity = 20000;
        flareSize = 6;
    };

    class F_Signal_Green: FlareBase {
        intensity = 20000;
        flareSize = 12;
    };

    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 80000;
        flareSize = 12;
        timeToLive = 60;
    };

    class ACE_F_Hand_White: F_20mm_White {
        timeToLive = 60;
    };

    class F_20mm_Red;
    class ACE_F_Hand_Red: F_20mm_Red {
        timeToLive = 60;
    };

    class F_20mm_Green;
    class ACE_F_Hand_Green: F_20mm_Green {
        timeToLive = 60;
    };

    class F_20mm_Yellow;
    class ACE_F_Hand_Yellow: F_20mm_Yellow {
        timeToLive = 60;
    };

    class SmokeShell;
    class ACE_G_Handflare_White: SmokeShell {
        GVAR(flare) = 1;
        GVAR(color)[] = {0.5,0.5,0.5,0.5};
        GVAR(pullPinSound)[] = {"A3\sounds_f\weapons\smokeshell\smoke_1.wss", 0.4, 1, 10};
        model = "\A3\weapons_f\ammo\flare_white";
        dangerRadiusHit = -1;
        suppressionRadiusHit = -1;
        typicalSpeed = 22;
        cost = 100;
        deflecting = 30;
        explosionTime = 3;
        timeToLive = 60;
        grenadeFireSound[] = {};
        grenadeBurningSound[] = {};
        aiAmmoUsageFlags = "4 + 2";
        smokeColor[] = {0,0,0,0};
        effectsSmoke = "ACE_HandFlareEffect";
        whistleDist = 0;
    };
    class ACE_G_Handflare_Red: ACE_G_Handflare_White {
        GVAR(color)[] = {0.5,0.25,0.25,0.5};
        model = "\A3\weapons_f\ammo\flare_red";
    };
    class ACE_G_Handflare_Green: ACE_G_Handflare_White {
        GVAR(color)[] = {0.25,0.5,0.25,0.5};
        model = "\A3\weapons_f\ammo\flare_green";
    };
    class ACE_G_Handflare_Yellow: ACE_G_Handflare_White {
        GVAR(color)[] = {0.5,0.5,0.25,0.5};
        model = "\A3\weapons_f\ammo\flare_yellow";
    };

    class ACE_G_M84: SmokeShell {
        GVAR(flashbang) = 1;
        model = QPATHTOF(models\ACE_m84_thrown.p3d);
        dangerRadiusHit = -1;
        suppressionRadiusHit = 20;
        typicalSpeed = 22;
        cost = 40;
        explosive = 1E-7;
        deflecting = 15;
        explosionTime = 2.3;
        timeToLive = 6;
        grenadeFireSound[] = {};
        grenadeBurningSound[] = {};
        aiAmmoUsageFlags = "0";
        smokeColor[] = {0,0,0,0};
        effectsSmoke = "ACE_M84FlashbangEffect";
        whistleDist = 0;
    };
    
    class Chemlight_base: SmokeShell {
        GVAR(pullPinSound)[] = {"A3\sounds_f\weapons\Other\dry4.wss", 3, 2, 10};
        soundImpactHard1[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.8,65};
        soundImpactHard2[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.9,65};
        soundImpactHard3[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.6,65};
        soundImpactHard4[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,2,65};
        soundImpactHard5[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.5,65};
        soundImpactHard6[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.7,65};
        soundImpactHard7[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,2.1,65};
        soundImpactIron1[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,2.1,95};
        soundImpactIron2[] = {"A3\sounds_f\characters\footsteps\steel_run_4",1,1.75,95};
        soundImpactIron3[] = {"A3\sounds_f\characters\footsteps\steel_run_4",1,1.6,95};
        soundImpactIron4[] = {"A3\sounds_f\characters\footsteps\steel_run_2",1,2,95};
        soundImpactIron5[] = {"A3\sounds_f\characters\footsteps\steel_run_2",1,2.1,95};
        soundImpactWoodExt1[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_1",1,1.1,75};
        soundImpactWoodExt2[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_1",1,1.15,75};
        soundImpactWoodExt3[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_2",1,1.1,75};
        soundImpactWoodExt4[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_2",1,1.15,75};
    };
};
