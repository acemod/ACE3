
class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_RangeCard: ACE_ItemCore {
        author = "Ruthberg";
        scope = 2;
        displayName = CSTRING(Name);
        descriptionShort = CSTRING(Description);
        picture = QPATHTOF(UI\RangeCard_Icon.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
