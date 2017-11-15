class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Tripod: ACE_ItemCore {
        author = "Rocko, Scubaman3D";
        scope = 2;
        displayName = CSTRING(DisplayName);
        descriptionShort = "";
        model = QPATHTOF(data\w_sniper_tripod.p3d);
        picture = QPATHTOF(UI\w_sniper_tripod_ca.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 40;
        };
    };
};
