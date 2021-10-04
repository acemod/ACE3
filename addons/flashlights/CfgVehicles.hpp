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
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";

        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX991,1);
        };
    };

    class ACE_Flashlight_KSF1Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(KSF1_DisplayName);
        author = ECSTRING(common,ACETeam);
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";

        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_KSF1,1);
        };
    };

    class ACE_Flashlight_XL50Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(XL50_DisplayName);
        author = ECSTRING(common,ACETeam);
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";

        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_XL50,1);
        };
    };

    class Pistol_Base_F;
    class ACE_Item_Flashlight_Maglite_ML300L: Pistol_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Maglite_ML300L_DisplayName);
        author = ECSTRING(common,ACETeam);
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";

        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_Maglite_ML300L,1);
        };
    };

    class NATO_Box_Base;
    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_MX991,12);
        };
    };

    class EAST_Box_Base;
    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_KSF1,12);
        };
    };

    class IND_Box_Base;
    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_Flashlight_XL50,12);
        };
    };

    class FIA_Box_Base_F;
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
            MACRO_ADDITEM(ACE_Flashlight_Maglite_ML300L,2);
        };
    };
};
