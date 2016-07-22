class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Tags {
                displayName = CSTRING(Tag);
                condition = QUOTE(_player call FUNC(checkTaggable));
                statement = QUOTE(_player call FUNC(tagRandom));
                icon = QPATHTOF(UI\icons\iconTaggingBlack.paa);
                insertChildren = QUOTE(_player call FUNC(addTagActions));
            };
        };
    };


    class Item_Base_F;
    class ACE_Item_SpraypaintBlack: Item_Base_F {
        author = "jokoho48";
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(SpraypaintBlack);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlack,1);
        };
    };
    class ACE_Item_SpraypaintRed: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintRed);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintRed,1);
        };
    };
    class ACE_Item_SpraypaintGreen: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintGreen);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintGreen,1);
        };
    };
    class ACE_Item_SpraypaintBlue: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintBlue);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlue,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlack,5);
            MACRO_ADDITEM(ACE_SpraypaintRed,5);
            MACRO_ADDITEM(ACE_SpraypaintBlue,5);
            MACRO_ADDITEM(ACE_SpraypaintGreen,5);
        };
    };
};
