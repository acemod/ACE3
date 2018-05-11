class CfgWeapons {
    class Default;
    class InventoryItem_Base_F;
    
    class ItemCore: Default {
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
    class ACE_Camelbak: ItemCore {
        displayName = "Camelbak";
        picture = QPATHTOF(data\icons\camelbak_full.paa);
        descriptionShort = "A camelbak";

        class ItemInfo: InventoryItem_Base_F {
            mass= 13;
            type= 201;
        };
    };

    /*class ACE_Camelbak_Part: ItemCore
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

    class ACE_Camelbak_Empty: ItemCore
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
    class ACE_Waterbottle_Full: ItemCore {
        displayName = "Water Bottle (Full)";
        picture = QPATHTOF(data\icons\waterbottle_full.paa);
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = "A full waterbottle";

        ace_onDrink = "ACE_Waterbottle_Part";
    };

    class ACE_Waterbottle_Part: ItemCore {
        displayName = "Water Bottle (Half Full)";
        picture = QPATHTOF(data\icons\waterbottle_full.paa);
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = "A half full waterbottle";

        ace_onDrink = "ACE_Waterbottle_Empty";
        ace_onFill = "ACE_Waterbottle_Full";

        class ItemInfo: InventoryItem_Base_F {
            mass= 3;
            type= 201;
        };
    };

    class ACE_Waterbottle_Empty: ItemCore {
        displayName = "Water Bottle (Empty)";
        picture = QPATHTOF(data\icons\waterbottle_empty.paa);
        model = "\A3\Structures_F_EPA\Items\Food\BottlePlastic_V2_F.p3d";
        descriptionShort = "An empty waterbottle";

        ace_onFill = "ACE_Waterbottle_Full";

        class ItemInfo: InventoryItem_Base_F {
            mass= 1;
            type= 201;
        };
    };
    
    // MREs
    class ACE_MRE_Type1: ItemCore {
        displayName = "MRE: Lamb Curry";
        picture = QPATHTOF(data\icons\mre_type1.paa);
        model = QPATHTOF(data\mre.p3d);
        descriptionShort = "A delicious Meal Ready to Eat (lamb curry)";
        
        hiddenSections[] = {"Type"};
        hiddenSectionsTextures[] = {QPATHTOF(data\mre_type1.paa)};
    };
    
    class ACE_MRE_Type2: ItemCore {
        displayName = "MRE: Vegetable Pasta";
        picture = QPATHTOF(data\icons\mre_type2.paa);
        model = QPATHTOF(data\mre.p3d);
        descriptionShort = "A delicious Meal Ready to Eat (vegetable pasta)";
        
        hiddenSections[] = {"Type"};
        hiddenSectionsTextures[] = {QPATHTOF(data\mre_type2.paa)};
    };
};