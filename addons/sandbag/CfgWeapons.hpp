
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Sandbag_empty: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(sandbagEmpty_displayName);
        model = QPATHTOF(data\ace_sandbag_m.p3d);
        picture = QPATHTOF(data\m_sandbag_ca.paa);

        class ItemInfo: InventoryItem_Base_F {
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

        class ItemInfo: InventoryItem_Base_F {
            mass = 160;
        };
    };
    */
};
