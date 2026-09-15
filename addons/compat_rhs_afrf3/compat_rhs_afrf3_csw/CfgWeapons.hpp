class CfgWeapons {
    CREATE_CSW_PROXY(rhs_weap_2b14);
    CREATE_CSW_PROXY(rhs_weap_nsvt_effects);
    CREATE_CSW_PROXY(rhs_weap_KORD);
    CREATE_CSW_PROXY(RHS_weap_AGS30);
    CREATE_CSW_PROXY(rhs_weap_SPG9);
    CREATE_CSW_PROXY(rhs_weap_9K133_launcher);
    CREATE_CSW_PROXY(rhs_weap_9K115_2_launcher);

    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class GVAR(2b14_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                EGVAR(csw,mortarBaseplate) = "rhs_2b14_82mm_msv";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            // One WeaponSlot with a positive value for iconScale forces game to use icon overlay method.
            // Required, because the inventory icon has no accessory variants.
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 670; // 2B14 Mortar Weight
        };
        displayName = ECSTRING(CSW,2b14_tube);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\rhs_2b14_82mm_msv_ca.paa";
    };

    class GVAR(nsv_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,kordTripodLow) = "RHS_NSV_TriPod_MSV";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 550;
        };
        displayName = ECSTRING(CSW,nsv_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\RHS_NSV_TriPod_MSV_ca.paa";
    };

    class GVAR(kord_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,kordTripod) = "rhs_KORD_high_MSV";
                EGVAR(csw,kordTripodLow) = "rhs_KORD_MSV";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 550;
        };
        displayName = ECSTRING(CSW,kord_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\rhs_KORD_MSV_ca.paa";
    };

    class GVAR(ags30_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,sag30Tripod) = "RHS_AGS30_TriPod_MSV";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 400; // https://odin.tradoc.army.mil/mediawiki/index.php/AGS-17_Russian_30mm_Automatic_Grenade_Launcher
        };
        displayName = ECSTRING(CSW,ags30_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\RHS_AGS30_TriPod_MSV_ca.paa";
    };

    class GVAR(spg9_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,spg9Tripod) = "rhs_SPG9_INS";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 1000;
        };
        displayName = ECSTRING(csw,spg9_tube);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\rhs_SPG9_INS_ca.paa";
    };

    class GVAR(spg9m_carry): GVAR(spg9_carry) {
        class ace_csw: ace_csw {
            class assembleTo {
                EGVAR(csw,spg9Tripod) = "rhs_SPG9M_MSV";
            };
        };
        displayName = ECSTRING(csw,spg9m_tube);
        author = ECSTRING(common,ACETeam);
    };

    class GVAR(metis_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "rhs_Metis_9k115_2_msv";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 300;
        };
        displayName = ECSTRING(csw,metis_tube);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\rhs_Metis_9k115_2_msv_ca.paa";
    };

    class GVAR(kornet_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "rhs_Kornet_9M133_2_msv";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 600;
        };
        displayName = ECSTRING(csw,kornet_launcher);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\ico\rhs_Kornet_9M133_2_msv_ca.paa";
    };
};
