class CfgWeapons {
	class Missile_AA_04_Plane_CAS_01_F;
	class GVAR(m): Missile_AA_04_Plane_CAS_01_F {
		lockAcquire = 1; // auto lock

		author = "Brandon (TCVM)";
        displayName = "AIM-9M [ACE]";
        weaponLockDelay = 0.5;
		magazines[] = {QGVAR(2Rnd_Missile_9m), QGVAR(PylonRack_1Rnd_Missile_9m), QGVAR(PylonMissile_1Rnd_Missile_9m)};
	};

	class weapon_BIM9xLauncher;
	class GVAR(x): weapon_BIM9xLauncher {
		lockAcquire = 1; // auto lock

		author = "Brandon (TCVM)";
        displayName = "AIM-9X [ACE]";
        weaponLockDelay = 0.5;
		magazines[] = { QGVAR(magazine_Missile_9x), QGVAR(PylonMissile_Missile_9x), QGVAR(PylonRack_Missile_9x), QGVAR(PylonRack_Missile_9x_2) };
	};
};

