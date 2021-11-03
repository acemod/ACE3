class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Fortify: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(FortifyItem_name);
        descriptionShort = "";
        model = "\A3\Structures_F\Items\Tools\Hammer_F.p3d";
        picture = QPATHTOF(UI\hammer_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };
};
