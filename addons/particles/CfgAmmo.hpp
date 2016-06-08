class CfgAmmo {
    class GrenadeHand;

    // - Smoke hand grenades --------------------------------------------------
    class SmokeShell: GrenadeHand {
        smokeColor[] = {1, 1, 1, 1};
    };
    class SmokeShellRed: SmokeShell {
        smokeColor[] = {0.9528, 0.0438, 0.0410, 1};
    };
    class SmokeShellGreen: SmokeShell {
        smokeColor[] = {0.0328, 0.1626, 0.1023, 1};
    };
    class SmokeShellYellow: SmokeShell {
        smokeColor[] = {0.9610, 0.4505, 0.0109, 1};
    };
    class SmokeShellPurple: SmokeShell {
        smokeColor[] = {0.4622, 0.0578, 0.3154, 1};
    };
    class SmokeShellBlue: SmokeShell {
        smokeColor[] = {0.0355, 0.1863, 1.0000, 1};
    };
    class SmokeShellOrange: SmokeShell {
        smokeColor[] = {0.9132, 0.1763, 0.0070, 1};
    };

    // - 40mm smoke grenades --------------------------------------------------
    class G_40mm_Smoke: SmokeShell {
        smokeColor[] = {1, 1, 1, 1};
    };
    class G_40mm_SmokeRed: G_40mm_Smoke {
        smokeColor[] = {0.9528, 0.0438, 0.0410, 1};
    };
    class G_40mm_SmokeGreen: G_40mm_Smoke {
        smokeColor[] = {0.0328, 0.1626, 0.1023, 1};
    };
    class G_40mm_SmokeYellow: G_40mm_Smoke {
        smokeColor[] = {0.9610, 0.4505, 0.0109, 1};
    };
    class G_40mm_SmokePurple: G_40mm_Smoke {
        smokeColor[] = {0.4622, 0.0578, 0.3154, 1};
    };
    class G_40mm_SmokeBlue: G_40mm_Smoke {
        smokeColor[] = {0.0355, 0.1863, 1.0000, 1};
    };
    class G_40mm_SmokeOrange: G_40mm_Smoke {
        smokeColor[] = {0.9132, 0.1763, 0.0070, 1};
    };

    // - Artillery smoke submunition ------------------------------------------
    class SmokeShellArty: SmokeShell {
        explosionTime = 0;
        effectsSmoke = "ACE_ArtillerySmoke";
    };

    // - 120mm/155mm artillery smoke ------------------------------------------
    class SubmunitionBase;
    class Smoke_120mm_AMOS_White: SubmunitionBase {
        submunitionConeAngle = 10;
    };
};
