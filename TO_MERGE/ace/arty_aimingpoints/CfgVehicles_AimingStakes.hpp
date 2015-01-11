	// ace mortars aiming posts base class
	class ACE_Arty_AimingStakes : ACE_Arty_BaseThing {
		destrType = "DestructTree";
		weight = 1000;
		simulation = "house";

		model = QPATHTO_M(ACE_ARTY_AimingStakes.p3d);
		animated = 0;
		reversed = 0;
		autocenter = 1;
		sectionsInherit = "ACE_ARTY_AimingStakes";
		hiddenSelections[] = {"all"};
		class AnimationSources{};
		ACE_NOCARGOLOAD; ACE_Weight = 10000;
	};

	// aiming posts for US mortar usage
	// 2x M1A2 (ie 2m height) aiming Posts with M58, illumunation device, green
	class ACE_Arty_AimingPost_M1A2_M58 : ACE_Arty_AimingStakes {
		scope = 2;
		displayName = $STR_DN_ACE_ARTY_AIMINGPOST_M1A2_M58;
		hiddenSelections[] = {"lamp_1","lightpoint_1"};
		class MarkerLights {
			class Greenlight {
				name = "lightpoint_0";
				color[] = { 0, 0.5, 0.1, 0.0025 };
				ambient[] = { 0, 0.5, 0.1, 0.0025 };
				brightness = 0.0015;
				size = 0.00001;
				blinking = "false";
			};
		};
		ACE_CARGO_ONLY; ACE_Weight = 3;
	};
	// 2x M1A2 (ie 2m height) aiming Posts with M59, illumunation device, orange
	class ACE_Arty_AimingPost_M1A2_M59 : ACE_Arty_AimingPost_M1A2_M58 {
		displayName = $STR_DN_ACE_ARTY_AIMINGPOST_M1A2_M59;
		class MarkerLights: MarkerLights {
			class Orangelight: Greenlight {
				color[] = {255/255, 74/255, 0/255, 0.0025};
				ambient[] = {255/255, 74/255, 0/255, 0.0025};
			};
		};
	};
