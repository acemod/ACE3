class CfgWeapons {
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };

    class CUP_2b14_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,2b14_tube);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\Podnos\data\ui\podnos_2b14_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                ace_csw_mortarBaseplate = "CUP_I_2b14_82mm_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 670;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_m252_carry: CUP_2b14_carry {
        displayName = ECSTRING(csw,m252_tube);
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\M252\data\ui\icomap_mortar_m251_ca.paa";
        class ace_csw: ace_csw {
            class assembleTo {
                ace_csw_mortarBaseplate = "CUP_I_M252_AAF";
            };
        };
    };

    class CUP_l16a2_carry: CUP_2b14_carry {
        displayName = ECSTRING(csw,m252_tube);
        scope = 1;
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\M252\data\ui\icomap_mortar_m251_ca.paa";
        class ace_csw: ace_csw {
            class assembleTo {
                ace_csw_mortarBaseplate = "CUP_I_L16A2_AAF";
            };
        };
    };

    class CUP_m2_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,m2_gun);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\M2\data\ui\icomap_M2_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_m3Tripod = "CUP_I_M2StaticMG_AAF";
                ace_csw_m3TripodLow = "CUP_I_M2StaticMG_MiniTripod_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 840;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_DSHKM_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,dshk_gun);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\DShKM\data\ui\icomap_DShKM_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_kordTripod = "CUP_I_DSHKM_AAF";
                ace_csw_kordTripodLow = "CUP_I_DSHKM_MiniTriPod_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 740;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_KORD_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,kord_gun);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\KORD\data\ui\icomap_kord_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_kordTripod = "CUP_I_KORD_high_AAF";
                ace_csw_kordTripodLow = "CUP_I_KORD_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 550;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_AGS30_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,ags30_gun);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\AGS\data\ui\ags_static_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_sag30Tripod = "CUP_I_AGS_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 400;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_MK19_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,mk19_gun);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\Mk19\data\ui\icomap_mk19_stat_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_m3TripodLow = "CUP_I_MK19_TriPod_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 770;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_launch_Metis: Launcher_Base_F {
        ace_overpressure_angle = 45;
        ace_overpressure_range = 15;
        ace_overpressure_damage = 0.7;
        class ace_csw {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "CUP_I_Metis_AAF";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 300;
        };
    };

    class CUP_TOW_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,tow_tube);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\TOW\data\ui\icomap_tow_static_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_m220Tripod = "CUP_I_TOW_TriPod_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 500;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class CUP_TOW2_carry: CUP_TOW_carry {
        class ace_csw: ace_csw {
            class assembleTo {
                ace_csw_m220Tripod = "CUP_I_TOW2_TriPod_AAF";
            };
        };
    };

    class CUP_SPG9_carry: Launcher_Base_F {
        displayName = ECSTRING(csw,spg9_tube);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_Bag.p3d);
        modes[] = {};
        picture = "\CUP\Weapons\CUP_Weapons_StaticWeapons\SPG9\data\ui\icon_spg9_ca.paa";
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_spg9Tripod = "CUP_I_SPG9_AAF";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 1000;
            class MuzzleSlot {
                iconScale = 0.1;
            };
        };
    };

    class mortar_82mm;
    class CUP_proxy_mortar_82mm: mortar_82mm {
        magazineReloadTime = 0.5;
    };

    class CUP_Vhmg_M2_static;
    class CUP_proxy_m2: CUP_Vhmg_M2_static {
        magazineReloadTime = 0.5;
    };

    class CUP_Vhmg_DSHKM_veh;
    class CUP_proxy_DSHKM: CUP_Vhmg_DSHKM_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vhmg_KORD_veh;
    class CUP_proxy_KORD: CUP_Vhmg_KORD_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vhmg_AGS30_veh;
    class CUP_proxy_AGS30: CUP_Vhmg_AGS30_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vgmg_MK19_veh;
    class CUP_proxy_MK19: CUP_Vgmg_MK19_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vmlauncher_AT13_single_veh;
    class CUP_proxy_AT13: CUP_Vmlauncher_AT13_single_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vmlauncher_TOW_single_veh;
    class CUP_proxy_TOW: CUP_Vmlauncher_TOW_single_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vacannon_SPG9_veh;
    class CUP_proxy_SPG9: CUP_Vacannon_SPG9_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vcannon_M119_veh;
    class CUP_proxy_M119: CUP_Vcannon_M119_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vcannon_D30_veh;
    class CUP_proxy_D30: CUP_Vcannon_D30_veh {
        magazineReloadTime = 0.5;
    };

    class CUP_Vcannon_D30AT_veh;
    class CUP_proxy_D30AT: CUP_Vcannon_D30AT_veh {
        magazineReloadTime = 0.5;
    };
};
