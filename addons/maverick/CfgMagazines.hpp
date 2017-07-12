class CfgMagazines {
	class CA_Magazine;
	class VehicleMagazine : CA_Magazine {};
	
	class magazine_Missile_AGM_02_x1 : VehicleMagazine {};
	class PylonMissile_Missile_AGM_02_x1 : magazine_Missile_AGM_02_x1 {};
	class PylonMissile_Missile_AGM_02_x2 : magazine_Missile_AGM_02_x1 {};
	
	class 6Rnd_Missile_AGM_02_F : VehicleMagazine {};
	class PylonRack_1Rnd_Missile_AGM_02_F : 6Rnd_Missile_AGM_02_F {};
	class PylonRack_3Rnd_Missile_AGM_02_F : PylonRack_1Rnd_Missile_AGM_02_F{};
	
	class PylonRack_Missile_AGM_02_x1 : magazine_Missile_AGM_02_x1 {};
	class PylonRack_Missile_AGM_02_x2 : magazine_Missile_AGM_02_x1 {};
	
	class ace_magazine_missile_agm_02_laser_x1 : magazine_Missile_AGM_02_x1 {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x1;
		displayNameShort = $STR_ace_mav_mag_short;
	};

	class ace_pylonmissile_missile_agm_02_Laser_x1 : PylonMissile_Missile_AGM_02_x1 {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x1;
		displayNameShort = $STR_ace_mav_mag_short;
		pylonWeapon = "ace_MaverickL_Launcher";
	};
	class ace_pylonmissile_missile_agm_02_Laser_x2 : PylonMissile_Missile_AGM_02_x2 {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x1;
		displayNameShort = $STR_ace_mav_mag_short;
		pylonWeapon = "ace_MaverickL_Launcher";
	};

	class ace_PylonRack_1Rnd_Missile_AGM_02_Laser : PylonRack_1Rnd_Missile_AGM_02_F {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x1;
		displayNameShort = $STR_ace_mav_mag_short;
		pylonWeapon = "ace_MaverickL_Plane_CAS_01_F"
	};
	class ace_PylonRack_3Rnd_Missile_AGM_02_Laser : PylonRack_3Rnd_Missile_AGM_02_F {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x3;
		displayNameShort = $STR_ace_mav_mag_short;
		pylonWeapon = "ace_MaverickL_Plane_CAS_01_F"
	};
	
	class ace_PylonRack_Missile_AGM_02_Laser_x1 : PylonRack_Missile_AGM_02_x1 {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x1;
		displayNameShort = $STR_ace_mav_mag_short;
		pylonWeapon = "ace_MaverickL_Launcher";
	};
	class ace_PylonRack_Missile_AGM_02_Laser_x2 : PylonRack_Missile_AGM_02_x2 {
		ammo = "ace_missile_MaverickL";
		author = "xrufix";
		descriptionShort = $STR_ace_mav_mag_descr;
		displayName = $STR_ace_mav_mag_x2;
		displayNameShort = $STR_ace_mav_mag_short;
		pylonWeapon = "ace_MaverickL_Launcher";
	};
};
