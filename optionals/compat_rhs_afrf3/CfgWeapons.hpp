class CfgWeapons {

    class NVGoggles;
    class rhs_1PN138: NVGoggles { // Monocular
        modelOptics = "";
        EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_4096.paa);
        EGVAR(nightvision,bluRadius) = 0.13;
    };

    class hgun_Rook40_F;
    class rhs_weap_pya: hgun_Rook40_F {
        ACE_barrelTwist = 254.0;
        ACE_barrelLength = 111.76;
    };
    class Pistol_Base_F;
    class rhs_weap_makarov_pm: rhs_weap_pya {
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 93.472;
    };
    class rhs_weap_ak74m_Base_F;
    class rhs_weap_ak74m: rhs_weap_ak74m_Base_F {
        ACE_RailHeightAboveBore = -0.456233;
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };
    class rhs_weap_akm: rhs_weap_ak74m {
        ACE_RailHeightAboveBore = -0.456233;//from rhs_weap_akmn and rhs_weap_ak74m
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };
    class rhs_weap_aks74;
    class rhs_weap_aks74u: rhs_weap_aks74 {
        ACE_RailHeightAboveBore = -0.30262;
        ACE_barrelTwist = 160.02;
        ACE_barrelLength = 210.82;
    };
    class rhs_weap_svd: rhs_weap_ak74m {
        ACE_RailHeightAboveBore = -0.617396;
        ACE_barrelTwist = 238.76;
        ACE_barrelLength = 619.76;
    };
    class rhs_weap_svdp;
    class rhs_weap_svdp_npz: rhs_weap_svdp {
        ACE_RailHeightAboveBore = 4.3348;
    };
    class rhs_weap_svdp_wd: rhs_weap_svdp {
        ACE_RailHeightAboveBore = -0.617396;
    };
    class rhs_weap_svdp_wd_npz: rhs_weap_svdp_wd {
        ACE_RailHeightAboveBore = 4.3348;
    };
    class rhs_weap_svds: rhs_weap_svdp {
        ACE_RailHeightAboveBore = -0.617396;
        ACE_barrelTwist = 238.76;
        ACE_barrelLength = 563.88;
    };
    class rhs_weap_svds_npz: rhs_weap_svds {
        ACE_RailHeightAboveBore = 4.3348;
    };
    class rhs_pkp_base;
    class rhs_weap_pkp: rhs_pkp_base {
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 657.86;
    };
    class rhs_weap_pkm: rhs_weap_pkp {
        ACE_Overheating_allowSwapBarrel = 1;
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 645.16;
    };
    class rhs_weap_rpk74: rhs_weap_pkp {
        ACE_barrelTwist = 195.072;
        ACE_barrelLength = 589.28;
    };
    class rhs_weap_orsis_Base_F;
    class rhs_weap_t5000: rhs_weap_orsis_Base_F { // http://en.orsis.com/production/catalog/19046/
        ACE_barrelTwist = 254.0; // 1:10"
        ACE_barrelLength = 698.5; // 27.5"
        ACE_RailHeightAboveBore = 2.12198;
    };
    class rhs_acc_sniper_base;
    class rhs_acc_pso1m2: rhs_acc_sniper_base {
        ACE_ScopeHeightAboveRail = 4.41386;
        ACE_ScopeAdjust_Vertical[] = {0, 0};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.5;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class rhs_acc_pso1m21: rhs_acc_pso1m2 {
        ACE_ScopeHeightAboveRail = 7.75566;
        ACE_ScopeAdjust_Vertical[] = {0, 0};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.5;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class rhs_acc_dh520x56: ItemCore { // http://nightvision.ru/catalog/4/item/35
        ACE_ScopeHeightAboveRail = 4.71476;
        ACE_ScopeAdjust_Vertical[] = {0, 33};
        ACE_ScopeAdjust_Horizontal[] = {-9, 9};
        ACE_ScopeAdjust_VerticalIncrement = 0.1;
        ACE_ScopeAdjust_HorizontalIncrement = 0.1;
        class ItemInfo: InventoryOpticsItem_Base_F {
            class OpticsModes {
                class dedal_520 {
                    discreteDistance[] = {100};
                    discreteDistanceInitIndex = 0;
                };
            };
        };
    };
    class Launcher;
    class Launcher_Base_F: Launcher {
        class WeaponSlotsInfo;
    };
    class rhs_weap_rpg7: Launcher_Base_F {
        ace_reloadlaunchers_enabled = 1;
    };

    #define HEARING_PROTECTION_VICCREW EGVAR(hearing,protection) = 0.85; EGVAR(hearing,lowerVolume) = 0.6;
    #define HEARING_PROTECTION_EARMUFF EGVAR(hearing,protection) = 0.75; EGVAR(hearing,lowerVolume) = 0.5;
    #define HEARING_PROTECTION_PELTOR EGVAR(hearing,protection) = 0.75; EGVAR(hearing,lowerVolume) = 0;
    class H_HelmetB;
    class rhs_tsh4: H_HelmetB {
        HEARING_PROTECTION_VICCREW
    };

    class rhs_zsh7a: H_HelmetB {
        HEARING_PROTECTION_VICCREW
    };
    class rhs_zsh7a_alt: rhs_zsh7a {
        ACE_Protection = 1;
    };
    class rhs_zsh7a_mike;
    class rhs_zsh7a_mike_alt: rhs_zsh7a_mike {
        ACE_Protection = 1;
    };
    class rhs_zsh7a_mike_green;
    class rhs_zsh7a_mike_green_alt: rhs_zsh7a_mike_green {
        ACE_Protection = 1;
    };

    class rhs_gssh18: H_HelmetB {
        HEARING_PROTECTION_EARMUFF
    };

    class rhs_weap_d81;
    class rhs_weap_2a70: rhs_weap_d81 { // "Low pressure" 100mm cannon
        ace_overpressure_range = 15;
        ace_overpressure_damage = 0.5;
    };
    class cannon_120mm;
    class rhs_weap_2a28_base: cannon_120mm { // "Low pressure"
        ace_overpressure_range = 15;
        ace_overpressure_damage = 0.5;
    };

    CREATE_CSW_PROXY(rhs_weap_2b14);
    CREATE_CSW_PROXY(rhs_weap_nsvt_effects);
    CREATE_CSW_PROXY(rhs_weap_KORD);
    CREATE_CSW_PROXY(RHS_weap_AGS30);
    CREATE_CSW_PROXY(rhs_weap_SPG9);
    CREATE_CSW_PROXY(rhs_weap_9K133_launcher);
    CREATE_CSW_PROXY(rhs_weap_9K115_2_launcher);

    class GVAR(2b14_carry): Launcher_Base_F {
        class ACE_CSW {
            type = "weapon";
            deployTime = 20;
            pickupTime = 25;
            class assembleTo {
                EGVAR(csw,mortarBaseplate) = "rhs_2b14_82mm_msv";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,kordTripodLow) = "RHS_NSV_TriPod_MSV";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,kordTripod) = "rhs_KORD_high_MSV";
                EGVAR(csw,kordTripodLow) = "rhs_KORD_MSV";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,sag30Tripod) = "RHS_AGS30_TriPod_MSV";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
        class ACE_CSW {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                EGVAR(csw,spg9Tripod) = "rhsgref_ins_SPG9";
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
        class ACE_CSW {
            class assembleTo {
                EGVAR(csw,spg9Tripod) = "rhs_SPG9M_MSV";
            };
        };
        displayName = ECSTRING(csw,spg9m_tube);
    };

    class GVAR(metis_carry): Launcher_Base_F {
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "rhs_Metis_9k115_2_msv";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
        class ACE_CSW {
            type = "mount";
            deployTime = 4;
            pickupTime = 4;
            deploy = "rhs_Kornet_9M133_2_msv";
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
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
