class CfgCloudlets {
    class Default;

    // - Smoke hand grenades --------------------------------------------------
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
        lifeTimeVar = 1;
        animationSpeed[] = {1};
        animationSpeedCoef = 1;
        randomDirectionPeriod = 1;
        randomDirectionPeriodVar = 0;
        randomDirectionIntensity = 0.08;
        randomDirectionIntensityVar = 0;
        destroyOnWaterSurface = 1;
        destroyOnWaterSurfaceOffset = -8;
        positionVar[] = {0, 0, 0};
        colorVar[] = {0, 0, 0, 0};
        color[] = {
            {0.5, 0.5, 0.5, 1},
            {0.5, 0.5, 0.5, 0.7},
            {0.5, 0.5, 0.5, 0.5},
            {0.5, 0.5, 0.5, 0.5},
            {0.5, 0.5, 0.5, 0.1},
            {0.5, 0.5, 0.5, 0}
        };
        size[] = {0.05, 4, 12, 16};
        sizeVar = 0.5;
        weight = 1.275;
        moveVelocity[] = {0, 0, 0};
        moveVelocityVar[] = {0.1, 0.1, 0.1};
        rotationVelocity = 0;
        rotationVelocityVar = 20;
        volume = 1;
        rubbing = 0.1;
        onTimerScript = "";
        beforeDestroyScript = "";
        blockAIVisibility = 1;
    };
    class ACE_SmokeBaseMedium: ACE_SmokeBaseLarge {
        destroyOnWaterSurfaceOffset = -6;
        size[] = {0.05, 3, 9, 12};
    };
    class ACE_SmokeBaseSmall: ACE_SmokeBaseLarge {
        destroyOnWaterSurfaceOffset = -4;
        size[] = {0.05, 2, 6, 8};
    };

    // - 40mm smoke grenades --------------------------------------------------
    class ACE_SmokeBase40mm: ACE_SmokeBaseLarge {
        destroyOnWaterSurfaceOffset = -5;
        lifeTime = 15;
        size[] = {0.05, 2.5, 7.5, 10};
    };

    // - Artillery smoke submunition ------------------------------------------
    class ACE_SmokeBaseArtilleryLarge: ACE_SmokeBaseLarge {
        lifeTime = 45;
    };
    class ACE_SmokeBaseArtillerySmall: ACE_SmokeBaseSmall {
        lifeTime = 45;
    };

    // - Smoke on water surface -----------------------------------------------
    class ACE_SmokeAfterWaterWhite: ACE_SmokeBaseLarge {
        interval = 0.05;
        destroyOnWaterSurfaceOffset = -3;
        size[] = {0.05, 2, 6};
        sizeVar = 1;
        lifeTime = 10;
        color[] = {
            {0.5, 0.5, 0.5, 0.1},
            {0.5, 0.5, 0.5, 0}
        };
        moveVelocityVar[] = {0, 0, 0};
        colorCoef[] = {1, 1, 1, 1};
    };
    class ACE_SmokeAfterWaterRed: ACE_SmokeAfterWaterWhite {
        colorCoef[] = SMOKE_COLOR_RED;
    };
    class ACE_SmokeAfterWaterGreen: ACE_SmokeAfterWaterWhite {
        colorCoef[] = SMOKE_COLOR_GREEN;
    };
    class ACE_SmokeAfterWaterYellow: ACE_SmokeAfterWaterWhite {
        colorCoef[] = SMOKE_COLOR_YELLOW;
    };
    class ACE_SmokeAfterWaterPurple: ACE_SmokeAfterWaterWhite {
        colorCoef[] = SMOKE_COLOR_PURPLE;
    };
    class ACE_SmokeAfterWaterBlue: ACE_SmokeAfterWaterWhite {
        colorCoef[] = SMOKE_COLOR_BLUE;
    };
    class ACE_SmokeAfterWaterOrange: ACE_SmokeAfterWaterWhite {
        colorCoef[] = SMOKE_COLOR_ORANGE;
    };
    CLOUDLET_UNDERWATER(White);
    CLOUDLET_UNDERWATER(Red);
    CLOUDLET_UNDERWATER(Green);
    CLOUDLET_UNDERWATER(Yellow);
    CLOUDLET_UNDERWATER(Purple);
    CLOUDLET_UNDERWATER(Orange);
    CLOUDLET_UNDERWATER(Blue);
};
