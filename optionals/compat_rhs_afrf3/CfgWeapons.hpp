
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
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };
    class rhs_weap_akm: rhs_weap_ak74m {
        ACE_barrelTwist = 199.898;
        ACE_barrelLength = 414.02;
    };
    class rhs_weap_aks74;
    class rhs_weap_aks74u: rhs_weap_aks74 {
        ACE_barrelTwist = 160.02;
        ACE_barrelLength = 210.82;
    };
    class rhs_weap_svd: rhs_weap_ak74m {
        ACE_barrelTwist = 238.76;
        ACE_barrelLength = 619.76;
    };
    class rhs_weap_svdp;
    class rhs_weap_svds: rhs_weap_svdp {
        ACE_barrelTwist = 238.76;
        ACE_barrelLength = 563.88;
    };
    class rhs_pkp_base;
    class rhs_weap_pkp: rhs_pkp_base {
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 657.86;
    };
    class rhs_weap_pkm: rhs_weap_pkp {
        ACE_barrelTwist = 240.03;
        ACE_barrelLength = 645.16;
    };
    class rhs_weap_rpk74m: rhs_weap_pkp {
        ACE_barrelTwist = 195.072;
        ACE_barrelLength = 589.28;
    };
    class rhs_weap_orsis_Base_F;
    class rhs_weap_t5000: rhs_weap_orsis_Base_F { // http://en.orsis.com/production/catalog/19046/
        ACE_barrelTwist = 254.0; // 1:10"
        ACE_barrelLength = 698.5; // 27.5"
        ACE_RailHeightAboveBore = 2.4;
    };
    class rhs_acc_sniper_base;
    class rhs_acc_pso1m2: rhs_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = {0, 0};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.5;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class rhs_acc_pso1m21: rhs_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = {0, 0};
        ACE_ScopeAdjust_Horizontal[] = {-10, 10};
        ACE_ScopeAdjust_VerticalIncrement = 0.5;
        ACE_ScopeAdjust_HorizontalIncrement = 0.5;
    };
    class ItemCore;
    class InventoryOpticsItem_Base_F;
    class rhs_acc_dh520x56: ItemCore { // http://nightvision.ru/catalog/4/item/35
        ACE_ScopeHeightAboveRail = 4.6;
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
    class Launcher_Base_F;
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
};
