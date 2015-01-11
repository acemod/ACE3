class CfgWeapons {
	class CannonCore;
	class LauncherCore;
	class Mode_SemiAuto;
	
	class RocketPods: LauncherCore {
		canLock = 1;
	};
	class missiles_DAGR: RocketPods {
		canLock = 1;
	};
	/*
	class autocannon_Base_F: CannonCore {
		canLock = 1;
	};
	class cannon_120mm: CannonCore {
		canLock = 1;
		
		class player : Mode_SemiAuto {
			canLock = 1;
		};
	};
	class gatling_25mm: CannonCore {
		canLock = 1;
	};
	class autocannon_35mm: CannonCore {
		canLock = 1;
	};
	
	class launch_NLAW_F: Launcher_Base_F
	{
		canLock = 1;
	};*/
};