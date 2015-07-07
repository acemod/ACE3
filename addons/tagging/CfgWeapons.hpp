class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Spraypaint : ACE_ItemCore {
        author = "BaerMitUmlaut";
        displayname = CSTRING(spraypaint);
        descriptionShort = CSTRING(descSpraypaint);
        picture = QUOTE(PATHTOF(UI\itemSpraypaint.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
};