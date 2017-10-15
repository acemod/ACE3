class CfgWeapons {
	class Launcher;
	class Launcher_Base_F: Launcher {
		class WeaponSlotsInfo;
	};
	class GVAR(carryTripod): Launcher_Base_F {
		class GVAR(cswOptions) {
			deployTime = 3;
			pickupTime = 3;
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 440;
		};
		
		displayName = CSTRING(TripodFolded_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	class GVAR(staticATCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticATWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 320; // 9M113 Konkurs Weight
		};
		
		displayName = CSTRING(StaticATBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	
	class GVAR(staticAACarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticAAWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 320;
		};
		
		displayName = CSTRING(StaticAABag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	
	class GVAR(staticHMGCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticHMGWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 840;
		};
		
		displayName = CSTRING(StaticHMGBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	class GVAR(staticAutoHMGCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticAutoHMGWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 840;
		};
		
		displayName = CSTRING(StaticAutoHMGBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	class GVAR(staticHMGTallCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticHMGTallWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 840;
		};
		
		displayName = CSTRING(StaticHMGTallBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	
	class GVAR(staticGMGCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticGMGWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 780;
		};
		
		displayName = CSTRING(StaticGMGBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	class GVAR(staticAutoGMGCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticAutoGMGWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 780;
		};
		
		displayName = CSTRING(StaticAutoGMGBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	class GVAR(staticGMGTallCarry): Launcher_Base_F {
		class GVAR(cswOptions) {
			ace_csw_assembleTo = QGVAR(staticGMGTallWeapon);
		};
		class WeaponSlotsInfo: WeaponSlotsInfo {
			mass = 780;
		};
		
		displayName = CSTRING(StaticGMGTallBag_displayName);
		author = ECSTRING(common, ACETeam);
		scope = 2;
		model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
		modes[] = {};
	};
	
	// STATIC WEAPONS
	class HMG_Static;
	class GVAR(HMG_Static): HMG_Static {
		class GVAR(cswOptions) {
			deployTime = 15;
			pickupTime = 10;
			ammoLoadTime = 5;
			ammoUnloadTime = 5;
		};
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(HMGStatic_displayName);
		magazines[] = { GVAR(HMG_Dummy_200Rnd_mag), GVAR(100Rnd_127x99_mag) };
	};
	
	class GMG_20mm;
	class GVAR(GMG_20mm): GMG_20mm {
		class GVAR(cswOptions) {
			deployTime = 20;
			pickupTime = 15;
			ammoLoadTime = 5;
			ammoUnloadTime = 5;
		};
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(GMGStatic_displayName);
		magazines[] = { GVAR(20Rnd_20mm_G_belt), GVAR(GMG_Dummy_120Rnd_mag) };
	};
	
	class ace_javelin_Titan_Static;
	class GVAR(missiles_titan_static_AT): ace_javelin_Titan_Static {
		class GVAR(cswOptions) {
			deployTime = 25;
			pickupTime = 20;
			ammoLoadTime = 15;
			ammoUnloadTime = 10;
		};
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(ATStatic_displayName);
		magazines[] = { GVAR(1Rnd_GAT_missiles), GVAR(TitanAT_Dummy_Missile) };
	};
	
	class missiles_titan_static;
	class GVAR(missiles_titan_static_AA): missiles_titan_static {
		class GVAR(cswOptions) {
			deployTime = 25;
			pickupTime = 20;
			ammoLoadTime = 15;
			ammoUnloadTime = 10;
		};
		author = ECSTRING(common, ACETeam);
		displayName = CSTRING(AAStatic_displayName);
		magazines[] = { GVAR(1Rnd_GAA_missiles), GVAR(TitanAA_Dummy_Missile) };
	};
};