class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Spraypaint : ACE_ItemCore {
        author = "jokoho48";
        displayname = CSTRING(spraypaint);
        descriptionShort = CSTRING(descSpraypaint);
        picture = QUOTE(PATHTOF(UI\itemSpraypaint.paa));
        model = QUOTE(PATHTOF(data\SprayCan.p3d));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
};