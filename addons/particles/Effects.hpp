class SmokeShellWhiteEffect {
    class SmokeShell {
        type = "ACE_SmokeBaseLarge";
    };
    class SmokeShell2 {
        type = "ACE_SmokeBaseSmall";
    };
};

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

class ACE_SmokeAfterWater {
    class SmokeAfterWater {
        type = "ACE_SmokeAfterWater";
        simulation = "particles";
        position[] = {0, 0, 0};
        intensity = 1;
        interval = 1;
    };
};
class ACE_SmokeAfterWaterRed: ACE_SmokeAfterWater {
    class SmokeAfterWater: SmokeAfterWater {
        type = "ACE_SmokeAfterWaterRed";
    };
};
class ACE_SmokeAfterWaterGreen: ACE_SmokeAfterWater {
    class SmokeAfterWater: SmokeAfterWater {
        type = "ACE_SmokeAfterWaterGreen";
    };
};
class ACE_SmokeAfterWaterYellow: ACE_SmokeAfterWater {
    class SmokeAfterWater: SmokeAfterWater {
        type = "ACE_SmokeAfterWaterYellow";
    };
};
class ACE_SmokeAfterWaterPurple: ACE_SmokeAfterWater {
    class SmokeAfterWater: SmokeAfterWater {
        type = "ACE_SmokeAfterWaterPurple";
    };
};
class ACE_SmokeAfterWaterOrange: ACE_SmokeAfterWater {
    class SmokeAfterWater: SmokeAfterWater {
        type = "ACE_SmokeAfterWaterOrange";
    };
};
class ACE_SmokeAfterWaterBlue: ACE_SmokeAfterWater {
    class SmokeAfterWater: SmokeAfterWater {
        type = "ACE_SmokeAfterWaterBlue";
    };
};
