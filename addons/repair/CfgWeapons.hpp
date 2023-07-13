class CfgWeapons {
    class ItemCore;
    class ToolKit: ItemCore {
        class ItemInfo;
    };
    class ACE_Toolkit: ToolKit {
        baseWeapon = "ToolKit";
        scope = 1;
        class ItemInfo: ItemInfo {
            type = ITEM_TYPE_BIPOD;
        };
    };
};
