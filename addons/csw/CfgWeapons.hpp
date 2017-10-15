class CfgWeapons {
	class Launcher;
	class Launcher_Base_F: Launcher {
		class WeaponSlotsInfo;
	};
	class GVAR(m3CarryTripod): Launcher_Base_F {
		class GVAR(cswOptions) {
			deployTime = 3;
			pickupTime = 3;
			type = "mount";
			deploy = QGVAR(m3Tripod);
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
			assembleTo = QGVAR(staticATWeapon);
			baseTripod = QGVAR(m3m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticAAWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticHMGWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticAutoHMGWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticHMGTallWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticGMGWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticAutoGMGWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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
			assembleTo = QGVAR(staticGMGTallWeapon);
			baseTripod = QGVAR(m3Tripod);
			type = "weapon";
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