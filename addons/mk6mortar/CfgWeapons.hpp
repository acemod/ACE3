class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_RangeTable_82mm: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(rangetable_name);
        descriptionShort = CSTRING(rangetable_description);
        picture = QPATHTOF(UI\icon_rangeTable.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class CannonCore;
    class mortar_82mm: CannonCore {
        class Single1;
    };
    class ACE_mortar_82mm: mortar_82mm {
        author = ECSTRING(common,ACETeam);
        magazines[] = {"ACE_1Rnd_82mm_Mo_HE","ACE_1Rnd_82mm_Mo_Smoke","ACE_1Rnd_82mm_Mo_Illum",
            "ACE_1Rnd_82mm_Mo_HE_Guided","ACE_1Rnd_82mm_Mo_HE_LaserGuided"};
        modes[] = {"Single1","Single2","Single3"};
        reloadTime = 0.5;
        magazineReloadTime = 0.5;
        class Single1: Single1 {
            reloadTime = 0.5;
        };
    };
};
