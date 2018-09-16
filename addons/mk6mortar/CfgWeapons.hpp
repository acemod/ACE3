class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_RangeTable_82mm: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(rangetable_name);
        descriptionShort = CSTRING(rangetable_description);
        picture = QPATHTOF(UI\icon_rangeTable.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };

    class ACE_Propelling_Charge: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(propelling_charge_name);
        descriptionShort = CSTRING(propelling_charge_description);
        model = QPATHTOF(data\propelling_charge.p3d);
        picture = QPATHTOF(UI\w_propelling_charge_ca.paa);
        class ItemInfo: CBA_MiscItem_ItemInfo {
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
    class ACE_mortar_82mm_no_charges: ACE_mortar_82mm {
        author = ECSTRING(common,ACETeam);
        magazines[] = {
            "ACE_1Rnd_82mm_Mo_HE","ACE_1Rnd_82mm_Mo_HE_Charge_1", "ACE_1Rnd_82mm_Mo_HE_Charge_2", "ACE_1Rnd_82mm_Mo_HE_Charge_3","ACE_1Rnd_82mm_Mo_HE_Charge_4",
            "ACE_1Rnd_82mm_Mo_Smoke","ACE_1Rnd_82mm_Mo_Smoke_Charge_1","ACE_1Rnd_82mm_Mo_Smoke_Charge_2","ACE_1Rnd_82mm_Mo_Smoke_Charge_3","ACE_1Rnd_82mm_Mo_Smoke_Charge_4",
            "ACE_1Rnd_82mm_Mo_Illum","ACE_1Rnd_82mm_Mo_Illum_Charge_1","ACE_1Rnd_82mm_Mo_Illum_Charge_2","ACE_1Rnd_82mm_Mo_Illum_Charge_3","ACE_1Rnd_82mm_Mo_Illum_Charge_4",
            "ACE_1Rnd_82mm_Mo_HE_Guided", "ACE_1Rnd_82mm_Mo_HE_Guided_Charge_1","ACE_1Rnd_82mm_Mo_HE_Guided_Charge_2","ACE_1Rnd_82mm_Mo_HE_Guided_Charge_3","ACE_1Rnd_82mm_Mo_HE_Guided_Charge_4",
            "ACE_1Rnd_82mm_Mo_HE_LaserGuided","ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_1","ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_2","ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_3","ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_4"
        };
        modes[] = {"Single1"};
        class Single1: Single1 {
            displayName = "Semi";
            artilleryCharge = 1;
        };
    };
};
