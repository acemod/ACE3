
class CfgCloudlets {
    class GVAR(CookOff) {
        interval = 0.004;
        circleRadius = 0;
        circleVelocity[] = {2,2,2};
        particleShape = "\A3\data_f\ParticleEffects\Universal\Universal";
        particleFSNtieth = 16;
        particleFSIndex = 0;
        particleFSFrameCount = 32;
        particleFSLoop = 0;
        angle = 0;
        angleVar = 0;
        animationName = "";
        particleType = "Billboard";
        timerPeriod = 1;
        lifeTime = 1;
        moveVelocity[] = {0,4,0};
        rotationVelocity = 1;
        weight = 0.4;
        volume = 0.45;
        rubbing = 0;
        size[] = {0.01,0.5,1,1,1.5,0.01,0.001};
        color[] = {{1,1,1,-4},{1,1,1,-3},{1,1,1,-2},{1,1,1,-1},{1,1,1,0}};
        animationSpeed[] = {1};
        randomDirectionPeriod = 5;
        randomDirectionIntensity = 1;
        onTimerScript = "";
        beforeDestroyScript = "";
        position[] = {0,0,0};
        lifeTimeVar = 0;
        positionVar[] = {0,0,0};
        positionVarConst[] = {0,0,0};
        moveVelocityVar[] = {1,2,1};
        moveVelocityVarConst[] = {0,0,0};
        rotationVelocityVar = 3;
        sizeVar = 0.1;
        colorVar[] = {0,0,0,2};
        randomDirectionPeriodVar = 1;
        randomDirectionIntensityVar = 2;
        colorCoef[] = {1,1,1,1};
        sizeCoef = 1;
        animationSpeedCoef = 1;
        particleEffects = "";
        postEffects = "";
        onSurface = 1;
        surfaceOffset = 0;
        keepOnSurface = 0;
        bounceOnSurface = 0.6;
        bounceOnSurfaceVar = 0;
        destroyOnWaterSurface = 0;
        destroyOnWaterSurfaceOffset = 0;
    };
};

class GVAR(ExploAmmoExplosion) {
    class ExploAmmoFlash {
        position[] = {0,0,0};
        simulation = "particles";
        type = "ExploAmmoFlash";
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class LightExplosion {
        simulation = "light";
        type = "SparksLight";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 0.15;
    };
    class ExploAmmoSmoke {
        position[] = {0,0,0};
        simulation = "particles";
        type = "AutoCannonFired";
        intensity = 1.5;
        interval = 1.5;
        lifeTime = 1.5;
    };
};
