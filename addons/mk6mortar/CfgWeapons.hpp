class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_RangeTable_82mm: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACE_MK6MORTAR_rangetable_name";
        descriptionShort = "$STR_ACE_MK6MORTAR_rangetable_description";
        picture = QUOTE(PATHTOF(UI\icon_rangeTable.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };
};
