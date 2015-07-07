class CfgVehicles {
    class UserTexture1m_F;
    class ACE_tagWall0 : UserTexture1m_F {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag0.paa"};
    };
    class ACE_tagWall1 : UserTexture1m_F {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag1.paa"};
    };
    class ACE_tagWall2 : UserTexture1m_F {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag2.paa"};
    };
    class ACE_tagWall3 : UserTexture1m_F {
        hiddenSelectionsTextures[] = {"\z\ace\addons\tagging\UI\tag3.paa"};
    };
    class ACE_tagWall4 : UserTexture1m_F {
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
                    hotkey = "T";
                };
            };
        };
    };
};