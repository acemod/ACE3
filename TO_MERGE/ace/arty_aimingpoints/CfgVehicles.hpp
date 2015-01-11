class CfgVehicles {
	class Thing;
	class ReammoBox;
	class ACE_Arty_BaseThing;
	// aiming stakes classes 
	#include "CfgVehicles_AimingStakes.hpp"
	#include "CfgVehicles_Ammoboxes.hpp"
	#include "CfgVehicles_Collimator.hpp"
	class Land;
	class LandVehicle: Land {
		class NewTurret;
	};
	class StaticWeapon: LandVehicle {
		class Turrets;
	};
	class StaticCannon: StaticWeapon {
		class Turrets: Turrets {
			class MainTurret;
		};
	};
	class ace_aimingcircle_base: StaticCannon {
		class Turrets: Turrets {
			class MainTurret : MainTurret {
				class ViewOptics;
			};
		};
	};
	class ACE_Arty_M2A2_Aiming_Circle: ace_aimingcircle_base  {
		scope = 2;
		displayName = $STR_DSS_ACE_ARTY_AIMINGCIRCLE_M2A2;
		model = QPATHTO_M(ace_arty_m2a2_aiming_circle.p3d);
		icon = QPATHTO_T(data\equip\m2a2_icon_ca.paa);
		vehicleClass = "ACE_Arty_Equipment";
		animated = 0;
		reversed = 0;
		autocenter = 0;
		mapSize = 0.5;
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				weapons[] = {};
				magazines[] = {};
				memoryPointsGetInGunner = "pos_gunner_dir";
				memoryPointsGetInGunnerDir = "pos_gunner";
				gunnerOpticsModel = "\x\ace\addons\sys_arty_m119\ace_arty_m119_scope";
				gunnerAction = "M2_Gunner";
				gunBeg = "gunBegin";
				gunEnd = "gunEnd";
				proxyIndex = 1;
				maxHorizontalRotSpeed = 4;
				class ViewOptics : ViewOptics {
					initFov = 0.0787019;
					minFov = 0.0787019;
					maxFov = 0.0787019;
				};
			};
		};
		
		class AnimationSources {
			class MainGun {
				source="user";
				animPeriod=0.02;
				initPhase=0;
				minValue="-400";
				maxValue="800";
			};
			class MainTurret {
				source="user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-6400";
				maxValue="6400";
			};
			class upper_motion {
				source="user";
				initPhase = 0;
				animPeriod=0.002;
				minValue="-6400";
				maxValue="6400";
			};
			class deflection_knob {
				source="user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-100";
				maxValue="100";
			};
			class deflection_knob_coarse {
				type="rotation";
				source="user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-64";
				maxValue="64";
			};
			class elevation_knob {
				source="user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-100";
				maxValue="100";
			};
			class elevation_knob_coarse {
				source="user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-4";
				maxValue="8";
			};
			class orienting_knobs {
				source="user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-6400";
				maxValue="6400";
			};
			class left_cover {
				source="user";
				initPhase = 0;
				animPeriod=1;
				minValue="0";
				maxValue="1";
			};
			class right_cover {
				source="user";
				initPhase = 0;
				animPeriod=1;
				minValue="0";
				maxValue="1";
			};
			class compass_needle {
                source = "user";
				initPhase = 0;
				animPeriod=0.02;
				minValue="-360";
				maxValue="360";
            };
		};
		
		// class MarkerLights {
			// class Whitelight {
				// name = "optic_backlight";
				// color[] = {1,1,1, 0.0025};
				// ambient[] = {1,1,1, 0.0025};
				// brightness = 0.0005;
				// size = 0.00004;
				// blinking = "false";
			// };
		// };
		ACE_CARGO_ONLY; ACE_Weight = 20.5;
	};
};
