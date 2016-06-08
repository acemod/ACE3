class CfgCloudlets {
    class Default;

    // - Surface smoke --------------------------------------------------------
    class ACE_SmokeBaseLarge: Default {
        colorCoef[] = {"colorR", "colorG", "colorB", "colorA"};
        sizeCoef = 1;
        position[] = {0, 0, 0};
        interval = 0.05;
        circleRadius = 0;
        circleVelocity[] = {0, 0, 0};
        particleShape = QUOTE(PATHTOF(data\smoke.p3d));
        particleFSNtieth = 1;
        particleFSIndex = 0;
        particleFSFrameCount = 1;
        particleFSLoop = 0;
        angleVar = 0.1;
        animationName = "";
        particleType = "Billboard";
        timerPeriod = 1;
        lifeTime = 30;
        lifeTimeVar = 2;
        animationSpeed[] = {1};
        animationSpeedCoef = 1;
        randomDirectionPeriod = 1;
        randomDirectionPeriodVar = 0;
        randomDirectionIntensity = 0.2;
        randomDirectionIntensityVar = 0;
        destroyOnWaterSurface = 1;
        destroyOnWaterSurfaceOffset = -0.6;
        positionVar[] = {0, 0, 0};
        moveVelocityVar[] = {0.25, 0.25, 0.25};
        colorVar[] = {0, 0, 0, 0};
        color[] = {
            {0.5, 0.5, 0.5, 1},
            {0.5, 0.5, 0.5, 0.7},
            {0.5, 0.5, 0.5, 0.5},
            {0.5, 0.5, 0.5, 0.5},
            {0.5, 0.5, 0.5, 0.1},
            {0.5, 0.5, 0.5, 0}
        };
        size[] = {0.05, 7, 15, 20};
        sizeVar = 0.5;
        weight = 1.2777;
        moveVelocity[] = {0, 0, 0};
        rotationVelocity = 0;
        rotationVelocityVar = 20;
        volume = 1;
        rubbing = 0.1;
        onTimerScript = "";
        beforeDestroyScript = "";
        blockAIVisibility = 1;
    };
    class ACE_SmokeBaseSmall: ACE_SmokeBaseLarge {
        size[] = {0.05, 5, 7.5, 10};
    };

    // - Artillery smoke ------------------------------------------------------
    class ACE_SmokeBaseArtilleryLarge: ACE_SmokeBaseLarge {
        lifeTime = 45;
    };
    class ACE_SmokeBaseArtillerySmall: ACE_SmokeBaseSmall {
        lifeTime = 45;
    };

    // - Smoke on water surface -----------------------------------------------
    class ACE_SmokeAfterWater: ACE_SmokeBaseLarge {
        interval = 0.05;
        size[] = {0.05, 2, 5};
        sizeVar = 1;
        lifeTime = 10;
        color[] = {
            {0.5, 0.5, 0.5, 0.07},
            {0.5, 0.5, 0.5, 0}
        };
        moveVelocityVar[] = {0, 0, 0};
        colorCoef[] = {1, 1, 1, 1};
    };
    class ACE_SmokeAfterWaterRed: ACE_SmokeAfterWater {
        colorCoef[] = {0.9528, 0.0438, 0.0410, 1};
    };
    class ACE_SmokeAfterWaterGreen: ACE_SmokeAfterWater {
        colorCoef[] = {0.0328, 0.1626, 0.1023, 1};
    };
    class ACE_SmokeAfterWaterYellow: ACE_SmokeAfterWater {
        colorCoef[] = {0.9610, 0.4505, 0.0109, 1};
    };
    class ACE_SmokeAfterWaterPurple: ACE_SmokeAfterWater {
        colorCoef[] = {0.4622, 0.0578, 0.3154, 1};
    };
    class ACE_SmokeAfterWaterBlue: ACE_SmokeAfterWater {
        colorCoef[] = {0.0355, 0.1863, 1.0000, 1};
    };
    class ACE_SmokeAfterWaterOrange: ACE_SmokeAfterWater {
        colorCoef[] = {0.9132, 0.1763, 0.0070, 1};
    };
    class SmokeShellWhiteUW;
    class SmokeShellWhite2UW: SmokeShellWhiteUW {
        postEffects = "ACE_SmokeAfterWater";
    };
    class SmokeShellRedUW;
    class SmokeShellRed2UW: SmokeShellRedUW {
        postEffects = "ACE_SmokeAfterWaterRed";
    };
    class SmokeShellGreenUW;
    class SmokeShellGreen2UW: SmokeShellGreenUW {
        postEffects = "ACE_SmokeAfterWaterGreen";
    };
    class SmokeShellYellowUW;
    class SmokeShellYellow2UW: SmokeShellYellowUW {
        postEffects = "ACE_SmokeAfterWaterYellow";
    };
    class SmokeShellPurpleUW;
    class SmokeShellPurple2UW: SmokeShellPurpleUW {
        postEffects = "ACE_SmokeAfterWaterPurple";
    };
    class SmokeShellBlueUW;
    class SmokeShellBlue2UW: SmokeShellBlueUW {
        postEffects = "ACE_SmokeAfterWaterBlue";
    };
    class SmokeShellOrangeUW;
    class SmokeShellOrange2UW: SmokeShellOrangeUW {
        postEffects = "ACE_SmokeAfterWaterOrange";
    };
};
