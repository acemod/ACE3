class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_MapTools: ACE_ItemCore {
        displayName = CSTRING(Name);
        author = ECSTRING(common,ACETeam);
        descriptionShort = CSTRING(Description);
        model = QPATHTOF(data\ace_MapTools.p3d);
        picture = QPATHTOF(UI\maptool_item.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
