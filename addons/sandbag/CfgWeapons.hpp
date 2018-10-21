
class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Sandbag_empty: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(sandbagEmpty_displayName);
        model = QPATHTOF(data\ace_sandbag_m.p3d);
        picture = QPATHTOF(data\m_sandbag_ca.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };
    /*
    class ACE_Sandbag: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(sandbag_displayName);
        model = QPATHTOF(data\ace_sandbag_build.p3d);
        picture = QPATHTOF(data\m_sandbag_ca.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 160;
        };
    };
    */
};
