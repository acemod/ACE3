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
        ACE_isTool = 1;
        GVAR(fortifyTool) = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };
    class ACE_FortifyToken: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(FortifyToken_name);
        descriptionShort = "$5";
        picture = QPATHTOF(UI\token_ca.paa);
        scope = 2;
        scopeArsenal = 0;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };
};
