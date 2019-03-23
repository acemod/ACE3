class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_EntrenchingTool: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(EntrenchingToolName);
        descriptionShort = CSTRING(EntrenchingToolDescription);
        model = QPATHTOEF(apl,ace_entrchtool.p3d);
        picture = QPATHTOF(ui\w_entrchtool_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};
