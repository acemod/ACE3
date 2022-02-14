class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Fuel_Bottle: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(DisplayName);
        descriptionShort = "One Liter Fuel Bottle";
        model = QPATHTOF(data\fuel_bottle.p3d);
        picture = QPATHTOF(UI\fuel_bottle_co.paa);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};