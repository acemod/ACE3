class CfgWeapons {
    CREATE_CSW_PROXY(rhs_weap_DSHKM);

    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class GVAR(dshkm_carry): Launcher_Base_F {
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,kordTripod) = "rhsgref_ins_DSHKM";
                EGVAR(csw,kordTripodLow) = "rhsgref_ins_DSHKM_Mini_TriPod";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            // One WeaponSlot with a positive value for iconScale forces game to use icon overlay method.
            // Required, because the inventory icon has no accessory variants.
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 740;
        };
        displayName = ECSTRING(csw,dshk_gun);
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\rhsafrf\addons\rhs_heavyweapons\data\mapico\icomap_DShKM_CA.paa";
    };
};
