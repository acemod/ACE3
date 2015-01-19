
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Kestrel: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACE_Kestrel_Name";
        descriptionShort = "$STR_ACE_Kestrel_Description";
        model = PATHTOF(kestrel4500.p3d);
        picture = PATHTOF(data\4500NV.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
};
