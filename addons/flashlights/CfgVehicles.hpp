class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            //todo: add flashlight attach actions
        };
    };

    class Item_Base_F;

    class ACE_Flashlight_MX991Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(MX991_DisplayName);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_Flashlight_MX991 {
                name = "ACE_Flashlight_MX991";
                count = 1;
            };
        };
    };

    class ACE_Flashlight_KSF1Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(KSF1_DisplayName);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_Flashlight_KSF1 {
                name = "ACE_Flashlight_KSF1";
                count = 1;
            };
        };
    };

    class ACE_Flashlight_XL50Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(XL50_DisplayName);
        author = ECSTRING(common,ACETeam);
        vehicleClass = "WeaponAccessories";
        class TransportItems {
            class ACE_Flashlight_XL50 {
                name = "ACE_Flashlight_XL50";
                count = 1;
            };
        };
    };

    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;

    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX991,12);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_KSF1,12);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_XL50,12);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX991,12);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX991,12);
            MACRO_ADDITEM(ACE_Flashlight_KSF1,12);
            MACRO_ADDITEM(ACE_Flashlight_XL50,12);
        };
    };
};