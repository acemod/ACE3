class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_EarPlugs: ACE_ItemCore {
        displayName = CSTRING(EarPlugs_Name);
        descriptionShort = CSTRING(EarPlugs_Description);
        model = QUOTE(PATHTOF(data\ace_earplugs.p3d));
        picture = PATHTOF(UI\ACE_earplugs_x_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class H_HelmetB;
    class H_HelmetCrew_B: H_HelmetB {
        GVAR(protection) = 1;
        GVAR(lowerVolume) = 0.80;
    };
    class H_HelmetCrew_0: H_HelmetCrew_B {};
    class H_HelmetCrew_I: H_HelmetCrew_B {};

    class H_CrewHelmetHeli_B: H_HelmetB {
        GVAR(protection) = 0.85;
        GVAR(lowerVolume) = 0.75;
    };
    class H_CrewHelmetHeli_O: H_CrewHelmetHeli_B {};
    class H_CrewHelmetHeli_I: H_CrewHelmetHeli_B {};

    class H_PilotHelmetHeli_B: H_HelmetB {
        GVAR(protection) = 0.85;
        GVAR(lowerVolume) = 0.75;
    };
    class H_PilotHelmetHeli_O: H_PilotHelmetHeli_B {};
    class H_PilotHelmetHeli_I: H_PilotHelmetHeli_B {};

    class H_PilotHelmetFighter_B: H_HelmetB {
        GVAR(protection) = 1;
        GVAR(lowerVolume) = 0.80;
    };
    class H_PilotHelmetFighter_O: H_PilotHelmetFighter_B {};
    class H_PilotHelmetFighter_I: H_PilotHelmetFighter_B {};

    class HelmetBase;
    class H_Cap_headphones: HelmetBase {
        GVAR(protection) = 0.5;
        GVAR(lowerVolume) = 0.60;
    };
    class H_Cap_marshal: H_Cap_headphones {};

    class H_HelmetB_light: H_HelmetB {
        GVAR(protection) = 0.8;
        GVAR(lowerVolume) = 0.20;
    };

    class H_HelmetB_plain_mcamo;
    class H_HelmetSpecB: H_HelmetB_plain_mcamo {
        GVAR(protection) = 0.8;
        GVAR(lowerVolume) = 0.20;
    };

};
