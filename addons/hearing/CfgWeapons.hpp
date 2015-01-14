class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_EarBuds: ACE_ItemCore {
        displayName = "$STR_ACE_Hearing_Earbuds_Name";
        descriptionShort = "$STR_ACE_Hearing_Earbuds_Description";
        model = QUOTE(PATHOF(ACE_earplugs.p3d));
        picture = QUOTE(PATHOF(UI\ACE_earplugs_x_ca.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};