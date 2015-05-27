class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_microDAGR: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = CSTRING(itemName);
        descriptionShort = CSTRING(itemDescription);
        picture = QUOTE(PATHTOF(images\microDAGR_item.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
};
