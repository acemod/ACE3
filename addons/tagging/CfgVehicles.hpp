class CfgVehicles {
    class UserTexture1m_F;
    class ACE_tagWall0 : UserTexture1m_F {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag0.paa"};
        scope = 1;
    };
    class ACE_tagWall1 : ACE_tagWall0 {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag1.paa"};
    };
    class ACE_tagWall2 : ACE_tagWall0 {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag2.paa"};
    };
    class ACE_tagWall3 : ACE_tagWall0 {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag3.paa"};
    };
    class ACE_tagWall4 : ACE_tagWall0 {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag4.paa"};
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_tagWall {
                    displayName = CSTRING(tagWall);
                    condition = QUOTE(('ACE_Spraypaint' in items ACE_player) && ([] call FUNC(checkTaggable)));
                    statement = QUOTE([] call FUNC(tagWall));
                    showDisabled = 0;
                    priority = 3;
                    icon = QUOTE(PATHTOF(UI\iconTagging.paa));
                };
                class ACE_tagGround {
                    displayName = CSTRING(tagGround);
                    condition = QUOTE('ACE_Spraypaint' in items ACE_player);
                    statement = QUOTE([] call FUNC(tagGround));
                    showDisabled = 0;
                    priority = 3;
                    icon = QUOTE(PATHTOF(UI\iconTagging.paa));
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Spraypaint: Item_Base_F {
        author = "jokoho48";
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(spraypaint);
        vehicleClass = "Items";
        class TransportItems {
            class ACE_Spraypaint {
                name = "ACE_Spraypaint";
                count = 1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Spraypaint,5);
        };
    };
};