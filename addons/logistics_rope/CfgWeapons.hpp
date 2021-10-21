class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;
    class ACE_ropeBase: ACE_ItemCore {
        scope = 1;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        descriptionShort = CSTRING(descriptionShort);
    };

    class ACE_rope3: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 3.2;
        displayName = CSTRING(Rope_3_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 6;
        };
    };
    class ACE_rope6: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 6.2;
        displayName = CSTRING(Rope_6_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 18;
        };
    };
    class ACE_rope12: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 12.2;
        displayName = CSTRING(Rope_12_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 36;
        };
    };
    class ACE_rope15: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 15.2;
        displayName = CSTRING(Rope_15_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 45;
        };
    };
    class ACE_rope18: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 18.3;
        displayName = CSTRING(Rope_18_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 54;
        };
    };
    class ACE_rope27: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 27.4;
        displayName = CSTRING(Rope_27_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 81;
        };
    };
    class ACE_rope36: ACE_ropeBase {
        scope = 2;
        GVAR(length) = 36.6;
        displayName = CSTRING(Rope_36_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 108;
        };
    };
};