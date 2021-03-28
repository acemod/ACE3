class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_rope12: ACE_ItemCore {
        scope = 2;
        GVAR(ropeLength) = 12.2;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        displayName = CSTRING(Rope_12_Display);
        descriptionShort = CSTRING(descriptionShort);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 36;
        };
    };
    class ACE_rope15: ACE_ItemCore {
        scope = 2;
        GVAR(ropeLength) = 15.2;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        displayName = CSTRING(Rope_15_Display);
        descriptionShort = CSTRING(descriptionShort);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 45;
        };
    };
    class ACE_rope18: ACE_ItemCore {
        scope = 2;
        GVAR(ropeLength) = 18.3;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        displayName = CSTRING(Rope_18_Display);
        descriptionShort = CSTRING(descriptionShort);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 54;
        };
    };
    class ACE_rope27: ACE_ItemCore {
        scope = 2;
        GVAR(ropeLength) = 27.4;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        displayName = CSTRING(Rope_27_Display);
        descriptionShort = CSTRING(descriptionShort);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 81;
        };
    };
    class ACE_rope36: ACE_ItemCore {
        scope = 2;
        GVAR(ropeLength) = 36.6;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        displayName = CSTRING(Rope_36_Display);
        descriptionShort = CSTRING(descriptionShort);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 108;
        };
    };
};
