class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Spraypaint : ACE_ItemCore {
        displayname = CSTRING(spraypaint);
        descriptionshort = CSTRING(descSpraypaint);
        model = "\A3\Structures_F_Mark\Items\Sport\AirHorn_01_F.p3d";
        picture = QUOTE(PATHTOF(UI\itemSpraypaint.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
};