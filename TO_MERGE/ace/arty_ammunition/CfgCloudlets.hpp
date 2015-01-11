//CfgCloudlets.hpp

class CfgCloudlets {
	class ARTY_ExplosionSmoke;
	class ace_arty_105mm_m84a1_m782_smokeCanisterHC_cloudlet1: ARTY_ExplosionSmoke {
		particleFSNtieth = 16;
        particleFSIndex = 12;
		particleFSFrameCount = 8;
        particleFSLoop = 0;
        animationSpeedCoef = 1;
        colorCoef[]={"colorR","colorG","colorB","colorA"};
        sizeCoef=1;
        position[]={0,0,0};
        interval=0.05;
        weight=10;
        volume=7.5;
        rubbing=0.05;
		lifeTime = 30;
		moveVelocity[] = {1, 0.5, 0.000};
		size[] = {0.75, 2, 12, 16, 32, 33, 34, 35};
		color[] = {
			{1, 1, 1, 0.5},
			{1, 1, 1, 1},
			{1, 1, 1,0.5},
			{1, 1, 1,0.25},
			{1, 1, 1,0}
		};
		lifeTimeVar = 1.5;
		positionVar[] = {0, 0, 0};
		rotationVelocityVar = 1;
		sizeVar = 1.2;
		colorVar[] = {0.1, 0.1, 0.1, 0.2};
		randomDirectionPeriod = 0.025;
		randomDirectionIntensity = 0.05;
		randomDirectionPeriodVar = 0.025;
		randomDirectionIntensityVar = 0.025;
    };
    class ace_arty_105mm_m84a1_m782_smokeCanisterHC_cloudlet2: ace_arty_105mm_m84a1_m782_smokeCanisterHC_cloudlet1 {
        lifeTime = 60;
		interval=0.15;
		weight=10;
		moveVelocity[] = {1, 0.5, 0.000};
        size[] = {0.5, 1, 10, 24, 24, 24, 24};
        color[] = {
			{0.9, 0.9, 0.9, 0.5},
			{0.9,0.9,0.9, 0.75},
			{0.9, 0.9, 0.9,0.5},
			{0.9, 0.91, 0.9,0.25},
			{1, 1, 1,0}
		};
    };
	
	class Default;
	class ace_arty_WPTrails: Default {
		interval = 0.1;
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 13;
		particleFSFrameCount = 2;
		particleFSLoop = 0;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 0.07;
		lifeTime = 5;
		moveVelocity[] = {0,6,0};
		rotationVelocity = 0;
		weight = 15;
		volume = 7.9;
		rubbing = 0.1;
		size[] = {0.5};
		color[] = {{ 1,1,1,1 }};
		animationSpeed[] = {1};
		randomDirectionPeriod = 1;
		randomDirectionIntensity = 0;
		onTimerScript = "\x\ace\addons\sys_arty_ammunition\effects\scripts\WPTrails.sqf";
		beforeDestroyScript = "\x\ace\addons\sys_arty_ammunition\effects\scripts\WPTrails_END.sqf";
		lifeTimeVar = 3;
		positionVar[] = {2,2,2};
		MoveVelocityVar[] = {12,6,12};
		rotationVelocityVar = 20;
		sizeVar = 0;
		colorVar[] = {0,0,0,0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};
	class ace_arty_WPTrails2: ace_arty_WPTrails {
		interval = 0.01;
		lifeTime = 6;
		lifeTimeVar = 4;
		MoveVelocityVar[] = {2,15,2};
		rotationVelocityVar = 30;
		moveVelocity[] = {0,8,0};
		onTimerScript = "\x\ace\addons\sys_arty_ammunition\effects\scripts\WPTrails2.sqf";
		beforeDestroyScript = "\x\ace\addons\sys_arty_ammunition\effects\scripts\WPTrails2.sqf";
	};
	class ace_arty_WPCloud: Default {
		interval = 0.02;
		circleRadius = 0;
		circleVelocity[] = {0,0,0};
		particleShape = "\ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 12;
		particleFSFrameCount = 13;
		particleFSLoop = 0;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = 60;
		moveVelocity[] = {0,0,0};
		rotationVelocity = 0;
		weight = 8.9;
		volume = 7;
		rubbing = 0.1;
		size[] = {5,10,13,16,18,20,21,22};
		color[] = {
			{ 1,1,1,1 },
			{ 1,1,1,0 }
		};
		animationSpeed[] = {1000};
		randomDirectionPeriod = 1;
		randomDirectionIntensity = 0;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 20;
		positionVar[] = {4,3,4};
		MoveVelocityVar[] = {0.2,0.2,0.2};
		rotationVelocityVar = 20;
		sizeVar = 0.3;
		colorVar[] = {0,0,0,0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};
	class ace_arty_WPCloud2: ace_arty_WPCloud {
		interval = 0.001;
		lifeTime = 5;
		lifeTimeVar = 5;
		weight = 32;
		volume = 20;
		color[] = {
			{ 1,1,1,1 },
			{ 1,1,1,0 }
		};
		colorVar[] = {0.1, 0.1, 0.1, 0};
		size[] = {5,10,13,16,18,20,21,22};
		moveVelocity[] = {0,5,0};
		MoveVelocityVar[] = {0.2,5,0.2};
	};
};