class CfgAmmo {
	class MissileCore;
	class MissileBase : MissileCore {
		class Components;
	};
	class Missile_AGM_02_F : MissileBase {};
	
	class GVAR(L) : Missile_AGM_02_F {
		author = "rufix";
		autoSeekTarget = 0;
		irLock = 0;
		laserLock = 0;
		manualControl = 0;
		missileLockMaxDistance = 16000;
		weaponLockSystem = 4;
		class ace_missileguidance {
			enabled = 1;

			minDeflection = 0.0005;
			maxDeflection = 0.01;
			incDeflection = 0.005;

			canVanillaLock = 0;

			defaultSeekerType = "SALH";
			seekerTypes[] = {"SALH"};

			defaultSeekerLockMode = "LOAL";
			seekerLockModes[] = {"LOAL","LOBL"};

			seekLastTargetPos = 1;
			seekerAngle = 60;
			seekerAccuracy = 1;

			seekerMinRange = 1;
			seekerMaxRange = 16000;

			defaultAttackProfile = "maverick";
			attackProfiles[] = {"maverick"};
		};
/*		class Components : Components {
			class SensorsManagerComponent {
				class Components {
					class LaserSensorComponent : SensorTemplateLaser {
						class Airtarget {
							minRange = 16000;
							maxRange = 16000;
						};
						class GroundTarget {
							minRange = 16000;
							maxRange = 16000;
						};
						allowsMarking = 1;
						angleRangeHorizontal = 20;
						angleRangeVertical = 20;
						groundNoiseDistanceCoef = -1;
						maxGroundNoiseDistance = -1;
						maxSpeedThreshold = 0;
						mxTrackableATL = 1e+010;
						maxTrackableSpeed = 1e10;
						minSpeedThreshold = 0;
						minTrackableATL = -1e+010;
						minTrackableSpeed = -1e+010;
						typeRecognitionDistance = 0;
					};
				};
			};
		};										*/
	};
};
