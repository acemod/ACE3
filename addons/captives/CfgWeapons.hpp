class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_CableTie: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        GVAR(restraint) = 1;
        displayName = CSTRING(CableTie);
        descriptionShort = CSTRING(CableTieDescription);
        model = QPATHTOF(models\ace_cabletie.p3d);
        picture = QPATHTOF(UI\ace_cabletie_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_Handcuffs: ACE_CableTie {
        GVAR(reusable) = 1;
        GVAR(locked) = 1;
        displayName = "Handcuffs"; //TODO: Localise
        descriptionShort = "A pair of reusable handcuffs used for restraining prisoners."; //TODO: Localise
        //model = QPATHTOF(models\ace_handcuffs.p3d); //No model source of current.
        //picture = QPATHTOF(UI\ace_handcuffs_ca.paa); //Icon pending.
        class ItemInfo: ItemInfo {
            mass = 6.025;
        };
    };
    class ACE_HandcuffKey: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        GVAR(key) = 1;
        displayName = "Handcuff Key"; //TODO: Localise
        descriptionShort = "A key for a handcuff."; //TODO: Localise
        //model = QPATHTOF(models\ace_handcuffkey.p3d); //No model source of current.
        //picture = QPATHTOF(UI\ace_handcuffkey_ca.paa); //Icon pending.
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
