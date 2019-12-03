class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };


    // Tripods:
    class GVAR(m3CarryTripod): Launcher_Base_F {
        class ADDON {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(m3Tripod);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 440;
        };
        displayName = CSTRING(m3TripodFolded_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\Tripod_Icon.paa);
    };
    class GVAR(m3CarryTripodLow): GVAR(m3CarryTripod) {
        class ADDON: ADDON {
            deploy = QGVAR(m3TripodLow);
        };
        displayName = CSTRING(m3TripodLowFolded_displayName);
    };

    class GVAR(kordCarryTripod): Launcher_Base_F {
        class ADDON {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(kordTripod);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 350;
        };
        displayName = CSTRING(kordTripodFolded_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\Tripod_Icon.paa);
    };

    class GVAR(kordCarryTripodLow): GVAR(kordCarryTripod) {
        class ADDON: ADDON {
            deploy = QGVAR(kordTripodLow);
        };
        displayName = CSTRING(kordTripodFoldedLow_displayName);
    };

    class GVAR(m220CarryTripod): Launcher_Base_F {
        class ADDON {
            type = "mount";
            deployTime = 10;
            pickupTime = 6;
            deploy = QGVAR(m220Tripod);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 210;
        };
        displayName = CSTRING(m220TripodFolded_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\Tripod_Icon.paa);
    };

    class GVAR(spg9CarryTripod): Launcher_Base_F {
        class ADDON {
            type = "mount";
            deployTime = 5;
            pickupTime = 3;
            deploy = QGVAR(spg9Tripod);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 260;
        };
        displayName = CSTRING(spg9_TripodFolded);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\Tripod_Icon.paa);
    };

    class GVAR(sag30CarryTripod): Launcher_Base_F {
        class ADDON {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(sag30Tripod);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 260;
        };
        displayName = CSTRING(sag30TripodFolded_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\Tripod_Icon.paa);
    };

    class GVAR(carryMortarBaseplate): Launcher_Base_F {
        class ADDON {
            type = "mount";
            deployTime = 2;
            pickupTime = 2;
            deploy = QGVAR(mortarBaseplate);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 290; // M3A1 baseblate weight
        };
        displayName = CSTRING(mortarBaseplateBag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\Tripod_Icon.paa); // todo
    };



    // Weapons:
    class GVAR(staticATCarry): Launcher_Base_F {
        class ADDON {
            type = "weapon";
            deployTime = 15;
            pickupTime = 20;
            class assembleTo {
                GVAR(m3Tripod) = "B_static_AT_F";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 320; // 9M113 Konkurs Weight
        };
        displayName = CSTRING(StaticATBag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticAT_Icon.paa);
    };

    class GVAR(staticAACarry): GVAR(staticATCarry) {
        class ADDON {
            type = "weapon";
            deployTime = 15;
            pickupTime = 20;
            class assembleTo {
                GVAR(m3Tripod) = "B_static_AA_F";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 320;
        };
        displayName = CSTRING(StaticAABag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticAT_Icon.paa);
    };

    class GVAR(staticHMGCarry): Launcher_Base_F {
        class ADDON {
            type = "weapon";
            deployTime = 7;
            pickupTime = 10;
            class assembleTo {
                GVAR(m3Tripod) = "B_HMG_01_high_F";
                GVAR(m3TripodLow) = "B_HMG_01_F";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 840;
        };
        displayName = CSTRING(StaticHMGBag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };

    class GVAR(staticGMGCarry): Launcher_Base_F {
        class ADDON {
            type = "weapon";
            deployTime = 5;
            pickupTime = 6;
            class assembleTo {
                GVAR(m3Tripod) = "B_GMG_01_high_F";
                GVAR(m3TripodLow) = "B_GMG_01_F";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 780;
        };
        displayName = CSTRING(StaticGMGBag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };


    class GVAR(staticMortarCarry): Launcher_Base_F {
        class ADDON {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                GVAR(mortarBaseplate) = "B_Mortar_01_F";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 620; // M252 Mortar Weight
        };
        displayName = CSTRING(mk6MortarBag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };

    // Proxy Weapons
    CREATE_CSW_PROXY(HMG_Static);
    CREATE_CSW_PROXY(GMG_20mm);

    class missiles_titan_static;
    class EGVAR(javelin,Titan_Static): missiles_titan_static {}; // if ace_javelin does not exist, this will just inherit from the base weapon
    class GVAR(Titan_AT_Static): EGVAR(javelin,Titan_Static) {
        EGVAR(javelin,enabled) = 1; // needs to be explicitly enabled
        magazineReloadTime = 0.5;
    };
    class GVAR(Titan_AA_Static) : missiles_titan_static {
        magazineReloadTime = 0.5;
    };


    /*
    class GVAR(staticAutoHMGCarry): Launcher_Base_F {
        class ADDON {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(m3Tripod) = GVAR(staticAutoHMGWeapon);
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 840;
        };

        displayName = CSTRING(StaticAutoHMGBag_displayName);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
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
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = QPATHTOF(UI\StaticHGMG_Icon.paa);
    };

 */
};

