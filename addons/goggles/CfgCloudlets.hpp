class CfgCloudlets {
    class Default;
    class ACERainEffect: Default {
        interval = 0.001;
        particleShape = "\A3\data_f\ParticleEffects\Universal\Refract";
        particleFSNtieth = 1;
        particleFSIndex = 0;
        particleFSFrameCount = 1;
        particleFSLoop = 1;

        particleType = "Billboard";
        lifeTime = 0.5;
        rotationVelocity = 1;
        weight = 100;
        volume = 0.000;
        rubbing = 1.7;
        size[] = {0.1};
        color[] = {{1,1,1,1}};
        animationSpeed[] = {0,1};
        randomDirectionPeriod = 0.2;
        randomDirectionIntensity = 1.2;
        positionVar[] = {2, 2, 2.5};
        sizeVar = 0.01;
        colorVar[] = {0, 0, 0, 0.1};
        destroyOnWaterSurface = 1;
    };
};
