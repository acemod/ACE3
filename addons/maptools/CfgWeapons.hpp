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
        ACE_isTool = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.2;
        };
    };

    class ACE_PlottingBoard: ACE_ItemCore {
        displayName = CSTRING(PlottingBoard_Name);
        author = ECSTRING(common,ACETeam);
        descriptionShort = CSTRING(PlottingBoard_Description);
        model = QPATHTOF(data\ace_MapTools.p3d);
        picture = QPATHTOF(UI\plottingboard_item.paa);
        scope = 2;
        ACE_isTool = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };
};
