class CfgMovesFatigue {
    //Reference https://community.bistudio.com/wiki/CfgMovesFatigue
    staminaDuration       = 150;//(default 60) total amount of stamina
    staminaCooldown       = 30; //(default 10) when you run out of stamina the sprinting is disabled for this duration
    staminaRestoration    = 90; //(default 30) time required for your current stamina pool (total stamina - inventory load) to restore
    aimPrecisionSpeedCoef = 0;  //(default 5) aimPrecision adjusting rate coefficient
    terrainDrainSprint    = 0;  //(default -1) when terrain gradient disable sprint, this stamina value is added to every animation state
    terrainDrainRun       = 0;  //(default -1) when terrain gradient enable force walk, this stamina value is added to every animation state
    terrainSpeedCoef      = 1;  //(default 0.9) when terrain gradient disable sprint, animation speed is multiplied by this value
};
// class CfgFatigue {
    // MinValue1 = 0.2;
    // MinValue2 = 0.8;
    // NormalRunSpeed = 10;
    // TiredRunSpeedLimit = 0.3;
// };

class CfgInGameUI {
    class CfgStaminaBar {
        //Same images, with a 50% transparancy
        textureEncumbranceBar = QUOTE(PATHTOF(ui\encumbrance_bar_t_ca.paa));
        textureStaminaBar = QUOTE(PATHTOF(ui\stamina_t_ca.paa));
        textureArrowLeft = QUOTE(PATHTOF(ui\arrow_left_t_ca.paa));
        textureArrowRight = QUOTE(PATHTOF(ui\arrow_right_t_ca.paa));
        textureIconTerrain = QUOTE(PATHTOF(ui\icon_terrain_t_ca.paa));
        textureIconInjury  = QUOTE(PATHTOF(ui\icon_cross_t_ca.paa));
        warningRate = -100; //to turn off the exhaustion rate based color change
    };
};