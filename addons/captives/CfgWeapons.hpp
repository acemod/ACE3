class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_CableTie: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(CableTie);
        descriptionShort = CSTRING(CableTieDescription);
        model = QPATHTOF(models\ace_cabletie.p3d);
        picture = QPATHTOF(UI\ace_cabletie_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
