class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_TagBlack {
                    displayName = CSTRING(TagBlack);
                    condition = QUOTE(('ACE_SpraypaintBlack' in items ACE_player) && {[] call FUNC(checkTaggable)});
                    statement = QUOTE([ARR_2(ACE_player,'black' call FUNC(getTexture))] call FUNC(tag));
                    showDisabled = 0;
                    priority = 3;
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingBlack.paa));
                };
                class ACE_TagRed: ACE_TagBlack {
                    displayName = CSTRING(TagRed);
                    condition = QUOTE(('ACE_SpraypaintRed' in items ACE_player) && {[] call FUNC(checkTaggable)});
                    statement = QUOTE([ARR_2(ACE_player,'red' call FUNC(getTexture))] call FUNC(tag));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingRed.paa));
                };
                class ACE_TagGreen: ACE_TagBlack {
                    displayName = CSTRING(TagGreen);
                    condition = QUOTE(('ACE_SpraypaintGreen' in items ACE_player) && {[] call FUNC(checkTaggable)});
                    statement = QUOTE([ARR_2(ACE_player,'green' call FUNC(getTexture))] call FUNC(tag));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingGreen.paa));
                };
                class ACE_TagBlue: ACE_TagBlack {
                    displayName = CSTRING(TagBlue);
                    condition = QUOTE(('ACE_SpraypaintBlue' in items ACE_player) && {[] call FUNC(checkTaggable)});
                    statement = QUOTE([ARR_2(ACE_player,'blue' call FUNC(getTexture))] call FUNC(tag));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingBlue.paa));
                };
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
