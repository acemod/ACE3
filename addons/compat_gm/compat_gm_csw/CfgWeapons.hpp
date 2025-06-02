class CfgWeapons {

    //// Carryable weapons
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    /// Milan
    class GVAR(milan_backpack): Launcher_Base_F {
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "gm_ge_army_milan_launcher_tripod_csw";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 362; // 16.4 kg
        };
        displayName = SUBCSTRING(Milan_displayName);
        scope = 2;
        scopeArsenal = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\gm\gm_weapons\gm_launchers\gm_milan\data\ui\picture_gm_milan_launcher_weaponBag_ca";
    };

    /// Fagot
    class GVAR(9k111_backpack): Launcher_Base_F {
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "gm_gc_army_fagot_launcher_tripod_csw";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                iconScale = 0.1;
            };
            mass = 496; // 22.5 kg
        };
        displayName = SUBCSTRING(9M111_displayName);
        scope = 2;
        scopeArsenal = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\gm\gm_weapons\gm_launchers\gm_fagot\data\ui\picture_gm_fagot_launcher_weaponBag_ca";
    };

    // MG3
    class gm_mg3_base;
    class gm_mg3_blk: gm_mg3_base {
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                GVAR(MG3Tripod) = "gm_ge_army_mg3_aatripod_csw";
            };
        };
    };

    // Tripods
    class ace_csw_m3CarryTripod: Launcher_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {};
    };
    class GVAR(MG3TripodCarry): ace_csw_m3CarryTripod {
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = QGVAR(MG3Tripod);
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 256; // fun number
        };
        displayName = SUBCSTRING(MG3Tripod_displayName);
        icon = "\gm\gm_weapons\gm_machineguns\gm_mg3\data\ui\map_gm_mg3_aatripod_ca";
        picture = "\gm\gm_weapons\gm_machineguns\gm_mg3\data\ui\picture_gm_mg3_aatripod_weaponBag_ca";
    };

    //// Proxy Weapons
    class gm_milan_launcher;
    class GVAR(milan_launcher_proxy): gm_milan_launcher {
        magazineReloadTime = 0.5;
    };

    class gm_fagot_launcher;
    class GVAR(9k111_launcher_proxy): gm_fagot_launcher {
        magazineReloadTime = 0.5;
    };
    class gm_120mm_m120;
    class GVAR(120mm_m120_proxy): gm_120mm_m120 {
        magazineReloadTime = 0.1;
    };
    class gm_120mm_2b11;
    class GVAR(120mm_2b11_proxy): gm_120mm_2b11 {
        magazineReloadTime = 0.1;
    };
};
