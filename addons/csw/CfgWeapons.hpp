class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };
    class GVAR(base_carry): Launcher_Base_F {
        class GVAR(options) {
            deployTime = 0;
            pickupTime = 0;
            type = "mount";
            deploy = "";
        };
        scope = 1;
    };
    class GVAR(m3CarryTripod): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\Tripod_Icon.paa);
    };
    class GVAR(staticMortarCarry): Launcher_Base_F {
        class GVAR(options) {
            assembleTo = "B_Mortar_01_F";
            baseTripod = QGVAR(m3Tripod);
            type = "weapon";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 910; // M252 Mortar Weight
        };
        
        displayName = CSTRING(StaticMortarBag_displayName);
        author = ECSTRING(common, ACETeam);
        scope = 2;
        model = QPATHTOF(data\ACE_CSW_WeaponBag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    class GVAR(staticATCarry): Launcher_Base_F {
        class GVAR(options) {
            assembleTo = QGVAR(staticATWeapon);
            baseTripod = QGVAR(m3Tripod);
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
        picture = QPATHTOF(UI\StaticAT_Icon.paa);
    };
    
    class GVAR(staticAACarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticAT_Icon.paa);
    };
    
    class GVAR(staticHMGCarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    class GVAR(staticAutoHMGCarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    class GVAR(staticHMGTallCarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    
    class GVAR(staticGMGCarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    class GVAR(staticAutoGMGCarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    class GVAR(staticGMGTallCarry): Launcher_Base_F {
        class GVAR(options) {
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
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };
    
    // STATIC WEAPONS
    class HMG_Static;
    class GVAR(HMG_Static): HMG_Static {
        class GVAR(options) {
            deployTime = 8;
            pickupTime = 15;
            ammoLoadTime = 5;
            ammoUnloadTime = 5;
        };
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(HMGStatic_displayName);
        magazines[] = { GVAR(HMG_Dummy_200Rnd_mag), GVAR(HMG_Dummy_200Rnd_mag_red), GVAR(HMG_Dummy_200Rnd_mag_green), GVAR(HMG_Dummy_200Rnd_mag_yellow), GVAR(100Rnd_127x99_mag), GVAR(100Rnd_127x99_mag_red), GVAR(100Rnd_127x99_mag_green), GVAR(100Rnd_127x99_mag_yellow) };
    };
    
    class GMG_20mm;
    class GVAR(GMG_20mm): GMG_20mm {
        class GVAR(options) {
            deployTime = 8;
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
        class GVAR(options) {
            deployTime = 15;
            pickupTime = 25;
            ammoLoadTime = 15;
            ammoUnloadTime = 10;
        };
        ace_javelin_enabled = 1;
        weaponInfoType = "ACE_RscOptics_Javelin";
        modelOptics = "\z\ace\addons\javelin\data\reticle_titan.p3d";
        canLock = 0;
        lockingTargetSound[] = {"", 0, 1};
        lockedTargetSound[] = {"", 0, 1};
        
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(ATStatic_displayName);
        magazines[] = { GVAR(1Rnd_GAT_missiles), GVAR(TitanAT_Dummy_Missile) };
    };
    
    class missiles_titan_static;
    class GVAR(missiles_titan_static_AA): missiles_titan_static {
        class GVAR(options) {
            deployTime = 15;
            pickupTime = 25;
            ammoLoadTime = 15;
            ammoUnloadTime = 10;
        };
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(AAStatic_displayName);
        magazines[] = { GVAR(1Rnd_GAA_missiles), GVAR(TitanAA_Dummy_Missile) };
    };
    
    class mortar_82mm;
    class ACE_mortar_82mm: mortar_82mm {
        class GVAR(options) {
            deployTime = 40;
            pickupTime = 30;
            //ammoLoadTime = 15;
            //ammoUnloadTime = 10;
        };
    };
};

