class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_EarPlugs: ACE_ItemCore {
        displayName = CSTRING(EarPlugs_Name);
        descriptionShort = CSTRING(EarPlugs_Description);
        model = PATHTOF(ACE_earplugs.p3d);
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
        GVAR(protection) = 0.75;
        GVAR(lowerVolume) = 0.70;
    };
    class H_CrewHelmetHeli_O: H_CrewHelmetHeli_B {};
    class H_CrewHelmetHeli_I: H_CrewHelmetHeli_B {};

    class H_PilotHelmetHeli_B: H_HelmetB {
        GVAR(protection) = 0.75;
        GVAR(lowerVolume) = 0.70;
    };
    class H_PilotHelmetHeli_O: H_PilotHelmetHeli_B {};
    class H_PilotHelmetHeli_I: H_PilotHelmetHeli_B {};

    class H_PilotHelmetFighter_B: H_HelmetB {
        GVAR(protection) = 1;
        GVAR(lowerVolume) = 0.80;
    };
    class H_PilotHelmetFighter_O: H_PilotHelmetFighter_B {};
    class H_PilotHelmetFighter_I: H_PilotHelmetFighter_B {};

    class H_Cap_headphones: H_HelmetB {
        GVAR(protection) = 0.5;
        GVAR(lowerVolume) = 0.60;
    };
    class H_Cap_marshal: H_Cap_headphones {};
};
