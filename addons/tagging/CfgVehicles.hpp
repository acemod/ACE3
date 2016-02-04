class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_tagWallBlack {
                    displayName = CSTRING(tagWallBlack);
                    condition = QUOTE(('ACE_SpraypaintBlack' in items ACE_player) && ([] call FUNC(checkTaggable)));
                    statement = QUOTE(['black'] call FUNC(tagWall));
                    showDisabled = 0;
                    priority = 3;
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingBlack.paa));
                };
                class ACE_tagWallRed: ACE_tagWallBlack {
                    displayName = CSTRING(tagWallRed);
                    condition = QUOTE(('ACE_SpraypaintRed' in items ACE_player) && ([] call FUNC(checkTaggable)));
                    statement = QUOTE(['red'] call FUNC(tagWall));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingRed.paa));
                };
                class ACE_tagWallGreen: ACE_tagWallBlack {
                    displayName = CSTRING(tagWallGreen);
                    condition = QUOTE(('ACE_SpraypaintGreen' in items ACE_player) && ([] call FUNC(checkTaggable)));
                    statement = QUOTE(['green'] call FUNC(tagWall));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingGreen.paa));
                };
                class ACE_tagWallBlue: ACE_tagWallBlack {
                    displayName = CSTRING(tagWallBlue);
                    condition = QUOTE(('ACE_SpraypaintBlue' in items ACE_player) && ([] call FUNC(checkTaggable)));
                    statement = QUOTE(['blue'] call FUNC(tagWall));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingBlue.paa));
                };
                class ACE_tagGroundBlack {
                    displayName = CSTRING(tagGroundBlack);
                    condition = QUOTE('ACE_SpraypaintBlack' in items ACE_player);
                    statement = QUOTE(['black'] call FUNC(tagGround));
                    showDisabled = 0;
                    priority = 3;
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingBlack.paa));
                };
                class ACE_tagGroundRed: ACE_tagGroundBlack {
                    displayName = CSTRING(tagGroundRed);
                    condition = QUOTE('ACE_SpraypaintRed' in items ACE_player);
                    statement = QUOTE(['red'] call FUNC(tagGround));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingRed.paa));
                };
                class ACE_tagGroundGreen: ACE_tagGroundBlack {
                    displayName = CSTRING(tagGroundGreen);
                    condition = QUOTE('ACE_SpraypaintGreen' in items ACE_player);
                    statement = QUOTE(['green'] call FUNC(tagGround));
                    icon = QUOTE(PATHTOF(UI\icons\iconTaggingGreen.paa));
                };
                class ACE_tagGroundBlue: ACE_tagGroundBlack {
                    displayName = CSTRING(tagGroundBlue);
                    condition = QUOTE('ACE_SpraypaintBlue' in items ACE_player);
                    statement = QUOTE(['blue'] call FUNC(tagGround));
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
        displayName = CSTRING(spraypaintBlack);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlack,1);
        };
    };
    class ACE_Item_SpraypaintRed: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(spraypaintRed);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintRed,1);
        };
    };
    class ACE_Item_SpraypaintGreen: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(spraypaintGreen);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintGreen,1);
        };
    };
    class ACE_Item_SpraypaintBlue: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(spraypaintBlue);
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