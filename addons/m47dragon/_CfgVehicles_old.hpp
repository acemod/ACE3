class CfgVehicles {
	class LandVehicle;
	
	class StaticWeapon : LandVehicle {
		class Turrets;
	};
	
	class StaticATWeapon : StaticWeapon {
		class Turrets: Turrets {
			class MainTurret;
		};
	};
	
	class ACE_M47_Static_Base : StaticATWeapon  {
		class Turrets: Turrets {
			class MainTurret : MainTurret {
				class ViewOptics;
			};
		};
	};

	class ACE_M47_Static: ACE_M47_Static_Base {
		scope = 1; // Hide it for now
		model = QUOTE(PATHTOF(models\ace_m47_static.p3d));
		displayName = "M47 Dragon";
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				gunnerAction = "LowKORD_Gunner";
				GVAR(tracker) = "TOWLauncherSingle";
				gunnerOpticsModel = QUOTE(PATHTOF(models\optics_m47));
				weapons[] = {"ACE_M47StaticLauncher"};
				magazines[] = {};
				class ViewOptics : ViewOptics {
					initFov = DRAGON_FOV;
					minFov = DRAGON_FOV;
					maxFov = DRAGON_FOV;
				};
			};
		};
		class AnimationSources {
			class rest_rotate {
				source="user";
				animPeriod=0.00001;
				initPhase=-0.35;
				maxValue="3.60";
				minValue="-3.60";
			};
			class optic_hide {
				source="user";
				animPeriod=0.0001;
				initPhase=1;
				maxValue="1";
				minValue="0";
			};
			class missile_hide {
				source="user";
				animPeriod=0.0001;
				initPhase=0;
				maxValue="1";
				minValue="0";
			};
		};
	};
};