class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_EarPlugs: ACE_ItemCore {
        displayName = CSTRING(EarPlugs_Name);
        descriptionShort = CSTRING(EarPlugs_Description);
        model = QPATHTOF(data\ace_earplugs.p3d);
        picture = QPATHTOF(UI\ACE_earplugs_x_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    #define HEARING_PROTECTION_VICCREW EGVAR(hearing,protection) = 0.85; EGVAR(hearing,lowerVolume) = 0.6;
    #define HEARING_PROTECTION_EARMUFF EGVAR(hearing,protection) = 0.75; EGVAR(hearing,lowerVolume) = 0.5;
    #define HEARING_PROTECTION_PELTOR EGVAR(hearing,protection) = 0.75; EGVAR(hearing,lowerVolume) = 0;

    class H_HelmetB;
    class H_HelmetCrew_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW
    };

    class H_CrewHelmetHeli_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW
    };

    class H_PilotHelmetHeli_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW
    };

    class H_PilotHelmetFighter_B: H_HelmetB {
        HEARING_PROTECTION_VICCREW
    };

    class HelmetBase;
    class H_Cap_headphones: HelmetBase {
        HEARING_PROTECTION_EARMUFF
    };

    class H_HelmetB_light: H_HelmetB {
        HEARING_PROTECTION_PELTOR
    };
    class H_HelmetB_camo: H_HelmetB {
        HEARING_PROTECTION_PELTOR
    };

    class H_HelmetB_plain_mcamo;
    class H_HelmetSpecB: H_HelmetB_plain_mcamo {
        HEARING_PROTECTION_PELTOR
    };

};
