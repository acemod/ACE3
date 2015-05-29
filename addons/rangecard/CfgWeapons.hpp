
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_RangeCard: ACE_ItemCore {
        author[] = {"Ruthberg"};
        scope = 2;
        displayName = "$STR_ACE_RangeCard_Name";
        descriptionShort = "$STR_ACE_RangeCard_Description";
        picture = PATHTOF(UI\RangeCard_Icon.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};
