class CfgWeapons {
	class LauncherCore;
	
	class RocketPods: LauncherCore {
		canLock = 1;    // Disable locking unless newb mode
	};
	class missiles_DAGR: RocketPods {
		canLock = 1;	// Disable locking unless newb mode
	};
};