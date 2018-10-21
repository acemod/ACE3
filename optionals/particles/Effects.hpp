// - Smoke hand grenades ------------------------------------------------------
class SmokeShellWhiteEffect {
    class SmokeShell {
        type = "ACE_SmokeBaseLarge";
    };
    class SmokeShell2 {
        type = "ACE_SmokeBaseSmall";
    };
};
EFFECT_HANDGRENADE(Red);
EFFECT_HANDGRENADE(Green);
EFFECT_HANDGRENADE(Yellow);
EFFECT_HANDGRENADE(Purple);
EFFECT_HANDGRENADE(Orange);
EFFECT_HANDGRENADE(Blue);

// - 40mm smoke grenades ------------------------------------------------------
class ACE_40mmSmokeShellWhiteEffect: SmokeShellWhiteEffect {
    class SmokeShell: SmokeShell {
        type = "ACE_SmokeBase40mm";
    };
};
EFFECT_40MM(Red);
EFFECT_40MM(Green);
EFFECT_40MM(Yellow);
EFFECT_40MM(Purple);
EFFECT_40MM(Orange);
EFFECT_40MM(Blue);

// - 120mm/155mm artillery smoke ----------------------------------------------
class ACE_ArtillerySmoke {
    class SmokeShell {
        type = "ACE_SmokeBaseArtilleryLarge";
        simulation = "particles";
        position[] = {0, 0, 0};
        intensity = 1;
        interval = 1;
    };
    class SmokeShell2 {
        type = "ACE_SmokeBaseArtillerySmall";
        simulation = "particles";
        position[] = {0, 0, 0};
        intensity = 1;
        interval = 1;
    };
};

// - Smoke on water surface ---------------------------------------------------
class ACE_SmokeAfterWaterWhite {
    class SmokeAfterWater {
        type = "ACE_SmokeAfterWaterWhite";
        simulation = "particles";
        position[] = {0, 0, 0};
        intensity = 1;
        interval = 1;
    };
};
EFFECT_AFTER_WATER(Red);
EFFECT_AFTER_WATER(Green);
EFFECT_AFTER_WATER(Yellow);
EFFECT_AFTER_WATER(Purple);
EFFECT_AFTER_WATER(Orange);
EFFECT_AFTER_WATER(Blue);
