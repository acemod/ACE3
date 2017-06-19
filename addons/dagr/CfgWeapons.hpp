
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_DAGR: ACE_ItemCore {
        author[] = {$STR_ACE_Common_ACETeam, "Ruthberg"};
        scope = 2;
        displayName = CSTRING(Name);
        model = QPATHTOF(data\DAGR.p3d);
        descriptionShort = CSTRING(Description);
        picture = QPATHTOF(UI\DAGR_Icon.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
};
