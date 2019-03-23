class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_DebugPotato: ACE_ItemCore {
        displayName = "ACE Potato (debug)";
        descriptionShort = "Glorious Potato<br/>If you see this in game it means someone fucked up";
        picture = QPATHTOF(UI\potato_ca.paa);
        scope = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
