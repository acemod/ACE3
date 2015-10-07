
class CfgAmmo {
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
        model = PATHTOF(models\ACE_m84_thrown.p3d);
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
};
