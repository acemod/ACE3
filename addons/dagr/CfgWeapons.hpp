
class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_DAGR: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(Name);
        model = QPATHTOF(data\DAGR.p3d);
        descriptionShort = CSTRING(Description);
        picture = QPATHTOF(UI\DAGR_Icon.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
};
