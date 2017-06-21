class CfgAmmo {
	class MissileCore;
	class MissileBase : MissileCore {
		class Components;
	};
	class Missile_AGM_02_F : MissileBase {};
	
	class xru_missile_AGM_02_Laser : Missile_AGM_02_F {
		author = "rufix";
		autoSeekTarget = 0;
		irLock = 0;
		laserLock = 1;
		missileLockMaxDistance = 16000;
		weaponLockSystem = 4;
		class Components : Components {
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
		};
	};
};
