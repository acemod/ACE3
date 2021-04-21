class CfgWeapons {
	class weapon_mim145Launcher;
	class GVAR(patriot): weapon_mim145Launcher {
		author = "Brandon (TCVM)";
		displayName = "MIM-104 Patriot";
		magazines[] = { QGVAR(patriot) };
		weaponLockDelay = 0.5;
	};

	class weapon_rim162Launcher;
	class GVAR(RIM162): weapon_rim162Launcher {
		author = "Brandon (TCVM)";
		displayName = "Mk-29 ESSM";
		magazines[] = { QGVAR(RIM162) };
		weaponLockDelay = 0.5;
	};

	class weapon_s750Launcher;
	class GVAR(s400): weapon_s750Launcher {
		author = "Brandon (TCVM)";
		displayName = "S-400";
		magazines[] = { QGVAR(s400) };
		weaponLockDelay = 0.5;
	};
};

