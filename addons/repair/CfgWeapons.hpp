class CfgWeapons {
    class ItemCore
    class ToolKit: ItemCore {
        class ItemInfo;
    };
    class ACE_ToolKit: ToolKit {
        scope = 1;
        class ItemInfo: ItemInfo {
            type = ITEM_TYPE_BIPOD; // Same as CBA_MiscItem_ItemInfo, removes repair enchantment
        };
    };
};
