class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    
    class ACE_ItemCore_Food: ACE_ItemCore {
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = "\A3\Weapons_F\Data\clear_empty.paa";
        muzzles[] = {};
        scope = 2;
        value = 1;
        count = 1;
        type = 16;

        class Armory {
            disabled = 0;
        };
        class ItemInfo: InventoryItem_Base_F {
            mass= 5;
            type= 201;
        };
    };

    // Camelbaks
    class ACE_Camelbak: ACE_ItemCore_Food {
        displayName = "Camelbak";
        picture = QPATHTOF(data\icons\camelbak_full.paa);
        descriptionShort = "A camelbak";

        class ItemInfo: InventoryItem_Base_F {
            mass= 13;
            type= 201;
        };
    };

    /*class ACE_Camelbak_Part: ACE_ItemCore_Food
    {
        displayName = "Camelbak (Half Full) - AN UNUSED ITEM FOR THE MOMENT";
        picture = QPATHTOF(data\icons\camelbak_full.paa);
        descriptionShort = "A half full camelbak - AN UNUSED ITEM FOR THE MOMENT";

        ace_onDrink = "ACE_Camelbak_Empty";
        ace_onFill = "ACE_Camelbak_Full";

        class ItemInfo: InventoryItem_Base_F
        {
            mass= 8;
            type= 201;
        };
    };

    class ACE_Camelbak_Empty: ACE_ItemCore_Food
    {
        displayName = "Camelbak (Empty) - AN UNUSED ITEM FOR THE MOMENT";
        picture = QPATHTOF(data\icons\camelbak_empty.paa);
        descriptionShort = "An empty camelbak - AN UNUSED ITEM FOR THE MOMENT";

        ace_onFill = "ACE_Camelbak_Full";

        class ItemInfo: InventoryItem_Base_F
        {
            mass= 3;
            type= 201;
        };
    };*/

    // Waterbottles
    class ACE_Waterbottle_Full: ACE_ItemCore_Food {
        displayName = CSTRING(ItemName_Waterbottle_Full);
        picture = QPATHTOF(data\icons\waterbottle_full.paa);
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = CSTRING(ItemDesc_Waterbottle_Full);

        GVAR(onDrink) = "ACE_Waterbottle_Part";
    };

    class ACE_Waterbottle_Part: ACE_ItemCore_Food {
        displayName = CSTRING(ItemName_Waterbottle_Part);
        picture = QPATHTOF(data\icons\waterbottle_full.paa);
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = CSTRING(ItemDesc_Waterbottle_Part);

        GVAR(onDrink) = "ACE_Waterbottle_Empty";
        GVAR(onFill) = "ACE_Waterbottle_Full";

        class ItemInfo: InventoryItem_Base_F {
            mass= 3;
            type= 201;
        };
    };

    class ACE_Waterbottle_Empty: ACE_ItemCore_Food {
        displayName = CSTRING(ItemName_Waterbottle_Empty);
        picture = QPATHTOF(data\icons\waterbottle_empty.paa);
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = CSTRING(ItemDesc_Waterbottle_Empty);

        GVAR(onFill) = "ACE_Waterbottle_Full";

        class ItemInfo: InventoryItem_Base_F {
            mass= 1;
            type= 201;
        };
    };
    
    // MREs
    class ACE_MRE_Type1: ACE_ItemCore_Food {
        displayName = CSTRING(ItemName_MRE_Type1);
        picture = QPATHTOF(data\icons\mre_type1.paa);
        model = QPATHTOF(data\mre.p3d);
        descriptionShort = CSTRING(ItemDesc_MRE_Type1);
        
        hiddenSections[] = {"Type"};
        hiddenSectionsTextures[] = {QPATHTOF(data\mre_type1.paa)};
    };
    
    class ACE_MRE_Type2: ACE_ItemCore_Food {
        displayName = CSTRING(ItemName_MRE_Type2);
        picture = QPATHTOF(data\icons\mre_type2.paa);
        model = QPATHTOF(data\mre.p3d);
        descriptionShort = CSTRING(ItemDesc_MRE_Type2);
        
        hiddenSections[] = {"Type"};
        hiddenSectionsTextures[] = {QPATHTOF(data\mre_type2.paa)};
    };
};