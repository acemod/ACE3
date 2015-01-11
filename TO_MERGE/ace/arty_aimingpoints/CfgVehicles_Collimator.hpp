class ACE_Arty_M1A1_Collimator: ACE_Arty_AimingStakes  {
	scope = 2;
	displayName = "$STR_DSS_ACE_ARTY_COLLIMATOR_M1A1";
	model = QPATHTO_M(sa_collimator.p3d);
	animated = 1;
	reversed = 0;
	autocenter = 0;
	class Reflectors {
		class Reflector {
			color[] = {1,1,1, 1};
			ambient[] = {1,1,1, 1};
			position = "optic_backlight";
			direction = "optic_proxy";
			hitpoint = "optic_backlight";
			selection = "optic_backlight";
			brightness = 0.001;
			size = 0.01;		
		};
	};
	class AnimationSources {
		class elevate_optic {
			source = "user";
			animPeriod = 0.01;
			minValue="-300";
			maxValue="300";
		};
		class rotate_optic {
			source = "user";
			animPeriod = 0.01;
			minValue="-6400";
			maxValue="6400";
		};
	};
	ACE_CARGO_ONLY; ACE_Weight = 14.5;
};

class ACE_Arty_Collimator_Proxy: ACE_Arty_BaseThing { // No idea wether this should be hidden or not
	scope = 1;
	displayName = "Collimator Proxy";
	destrType = "DestructTree";
	weight = 1000;
	simulation = "house";
	model = QPATHTO_M(collimator_test.p3d);
	animated = 1;
	reversed = 0;
	autocenter = 0;
	sectionsInherit = "collimator_test";

	class AnimationSources{
		class offset {
			source = "user";
			animPeriod = 0.00001;
			minValue = -100;
			maxValue = 100;
		};
		class expand_ul {
			source = "user";
			animPeriod = 0.00001;
			minValue = -1;
			maxValue = 1;
		};
		class expand_ur {
			source = "user";
			animPeriod = 0.00001;
			minValue = -1;
			maxValue = 1;
		};
		class expand_ll {
			source = "user";
			animPeriod = 0.00001;
			minValue = -1;
			maxValue = 1;
		};
		class expand_lr {
			source = "user";
			animPeriod = 0.00001;
			minValue = -1;
			maxValue = 1;
		};
	};
	ACE_CARGO_ONLY; ACE_Weight = 14.5;
};
