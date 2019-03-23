class CfgAmmo {
    class GrenadeHand;

    // - Smoke hand grenades --------------------------------------------------
    class SmokeShell: GrenadeHand {
        smokeColor[] = {1, 1, 1, 1};
        timeToLive = 90;
    };
    class SmokeShellRed: SmokeShell {
        smokeColor[] = SMOKE_COLOR_RED;
        timeToLive = 60;
    };
    class SmokeShellGreen: SmokeShell {
        smokeColor[] = SMOKE_COLOR_GREEN;
        timeToLive = 60;
    };
    class SmokeShellYellow: SmokeShell {
        smokeColor[] = SMOKE_COLOR_YELLOW;
        timeToLive = 60;
    };
    class SmokeShellPurple: SmokeShell {
        smokeColor[] = SMOKE_COLOR_PURPLE;
        timeToLive = 60;
    };
    class SmokeShellBlue: SmokeShell {
        smokeColor[] = SMOKE_COLOR_BLUE;
        timeToLive = 60;
    };
    class SmokeShellOrange: SmokeShell {
        smokeColor[] = SMOKE_COLOR_ORANGE;
        timeToLive = 60;
    };

    // - 40mm smoke grenades --------------------------------------------------
    class G_40mm_Smoke: SmokeShell {
        smokeColor[] = {1, 1, 1, 1};
        timeToLive = 40;
    };
    class G_40mm_SmokeRed: G_40mm_Smoke {
        smokeColor[] = SMOKE_COLOR_RED;
        timeToLive = 40;
    };
    class G_40mm_SmokeGreen: G_40mm_Smoke {
        smokeColor[] = SMOKE_COLOR_GREEN;
        timeToLive = 40;
    };
    class G_40mm_SmokeYellow: G_40mm_Smoke {
        smokeColor[] = SMOKE_COLOR_YELLOW;
        timeToLive = 40;
    };
    class G_40mm_SmokePurple: G_40mm_Smoke {
        smokeColor[] = SMOKE_COLOR_PURPLE;
        timeToLive = 40;
    };
    class G_40mm_SmokeBlue: G_40mm_Smoke {
        smokeColor[] = SMOKE_COLOR_BLUE;
        timeToLive = 40;
    };
    class G_40mm_SmokeOrange: G_40mm_Smoke {
        smokeColor[] = SMOKE_COLOR_ORANGE;
        timeToLive = 40;
    };

    // - Artillery smoke submunition ------------------------------------------
    class SmokeShellArty: SmokeShell {
        explosionTime = 0.1;
        effectsSmoke = "ACE_ArtillerySmoke";
    };

    // - 120mm/155mm artillery smoke ------------------------------------------
    class SubmunitionBase;
    class Smoke_120mm_AMOS_White: SubmunitionBase {
        submunitionConeAngle = 10;
    };
};
