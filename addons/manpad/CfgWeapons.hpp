class CfgWeapons {
	class weapon_rim116Launcher;
	class GVAR(rim116): weapon_rim116Launcher {
		author = "Brandon (TCVM)";
		displayName = "RIM-116";
		magazines[] = { QGVAR(rim116) };
		weaponLockDelay = 0.5;
	};

	class missiles_SAAMI;
	class GVAR(FIM92): missiles_SAAMI {
		author = "Brandon (TCVM)";
		displayName = "FIM-92 Stinger";
		magazines[] = { QGVAR(stinger) };
		weaponLockDelay = 0.5;
	};

	class Launcher_Base_F;
    class launch_Titan_base: Launcher_Base_F {
        magazines[] = {QGVAR(stinger_man)};
    };
};

