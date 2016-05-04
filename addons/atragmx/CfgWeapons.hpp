
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_ATragMX: ACE_ItemCore {
        author = "Ruthberg";
        scope = 2;
        displayName = CSTRING(Name);
        descriptionShort = CSTRING(Description);
        model = PATHTOF(data\tdsrecon.p3d);
        picture = PATHTOF(UI\ATRAG_Icon.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
};
