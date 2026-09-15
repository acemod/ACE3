class CfgWeapons {
    CREATE_CSW_PROXY(rhs_mortar_81mm);
    CREATE_CSW_PROXY(RHS_M2);
    CREATE_CSW_PROXY(RHS_MK19);
    CREATE_CSW_PROXY(Rhs_weap_TOW_Launcher_static);

    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class GVAR(m252_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                EGVAR(csw,mortarBaseplate) = "RHS_M252_WD";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            // One WeaponSlot with a positive value for iconScale forces game to use icon overlay method.
            // Required, because the inventory icon has no accessory variants.
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 620; // M252 Mortar Weight
        };
        displayName = ECSTRING(CSW,m252_tube);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsusf\addons\rhsusf_heavyweapons\data\ico\RHS_M252_D_ca.paa";
    };

    class GVAR(m2_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,m3Tripod) = "RHS_M2StaticMG_WD";
                EGVAR(csw,m3TripodLow) = "RHS_M2StaticMG_MiniTripod_WD";
                EGVAR(compat_spe,m3Tripod) = "RHS_M2StaticMG_MiniTripod_WD";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 840;
        };
        displayName = ECSTRING(CSW,m2_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsusf\addons\rhsusf_heavyweapons\data\ico\RHS_M2StaticMG_D_ca.paa";
    };

    class GVAR(mk19_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,m3TripodLow) = "RHS_MK19_TriPod_WD";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 770;
        };
        displayName = ECSTRING(CSW,mk19_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsusf\addons\rhsusf_heavyweapons\data\ico\RHS_MK19_TriPod_D_ca.paa";
    };

    class GVAR(tow_carry): Launcher_Base_F {
        dlc = "ace";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,m220Tripod) = "RHS_TOW_TriPod_WD";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 500;
        };
        displayName = ECSTRING(CSW,tow_tube);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsusf\addons\rhsusf_heavyweapons\data\Ico\RHS_TOW_TriPod_D_ca.paa";
    };
};
