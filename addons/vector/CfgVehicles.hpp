class CfgVehicles {
    class Item_Base_F;
    class ACE_Item_Vector: Item_Base_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(VectorName);
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        model = "\A3\Weapons_F\DummyBinoc.p3d";

        class TransportItems {
            MACRO_ADDITEM(ACE_Vector,1);
        };
    };

    class ACE_Item_VectorDay: Item_Base_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(VectorDayName);
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        vehicleClass = "Items";
        model = "\A3\Weapons_F\DummyBinoc.p3d";

        class TransportItems {
            MACRO_ADDITEM(ACE_VectorDay,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Vector,3);
            MACRO_ADDITEM(ACE_VectorDay,3);
        };
    };
};
