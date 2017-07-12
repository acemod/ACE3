class CfgWeapons {
	class LauncherCore;
	class RocketPods : LauncherCore {};
	class weapon_AGM_65Launcher : RocketPods{};
	
	class MissileLauncher : LauncherCore {};
	class Missile_AGM_02_Plane_CAS_01_F : MissileLauncher {};
	
	class ace_MaverickL_Launcher : weapon_AGM_65Launcher {
		author = "xrufix";
		displayname = $STR_ACE_MAV_WEAP;
		magazines[] = {
			"ace_magazine_missile_agm_02_laser_x1",
			"ace_pylonmissile_missile_agm_02_Laser_x1",
			"ace_pylonmissile_missile_agm_02_Laser_x2",
			"ace_PylonRack_1Rnd_Missile_AGM_02_Laser",
			"ace_PylonRack_3Rnd_Missile_AGM_02_Laser",
			"ace_PylonRack_Missile_AGM_02_Laser_x1",
			"ace_PylonRack_Missile_AGM_02_Laser_x2"
		};
		weaponLockDelay = 0.1;
		weaponLockSystem = 0;

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
	};
	
	class ace_MaverickL_Plane_CAS_01_F : Missile_AGM_02_Plane_CAS_01_F {
		author = "xrufix";
		displayname = $STR_ACE_MAV_WEAP;
		magazines[] = {
			"ace_magazine_missile_agm_02_laser_x1",
			"ace_pylonmissile_missile_agm_02_Laser_x1",
			"ace_pylonmissile_missile_agm_02_Laser_x2",
			"ace_PylonRack_1Rnd_Missile_AGM_02_Laser",
			"ace_PylonRack_3Rnd_Missile_AGM_02_Laser",
			"ace_PylonRack_Missile_AGM_02_Laser_x1",
			"ace_PylonRack_Missile_AGM_02_Laser_x2"
		};
		weaponLockDelay = 0.1;
		weaponLockSystem = 0;
		
        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
	};
};
