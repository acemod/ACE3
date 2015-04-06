
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_ATragMX: ACE_ItemCore {
        author = "Ruthberg";
        scope = 2;
        displayName = "$STR_ACE_ATragMX_Name";
        descriptionShort = "$STR_ACE_ATragMX_Description";
        picture = PATHTOF(UI\ATRAG.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
};
