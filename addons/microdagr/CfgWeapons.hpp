class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_microDAGR: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACE_microdagr_itemName";
        descriptionShort = "$STR_ACE_microdagr_itemDescription";
        picture = QUOTE(PATHTOF(images\microDAGR_item.paa));
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
};
