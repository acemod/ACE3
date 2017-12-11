
class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_Kestrel4500: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        displayName = CSTRING(Name);
        descriptionShort = CSTRING(Description);
        model = QPATHTOF(data\kestrel4500.p3d);
        picture = QPATHTOF(UI\Kestrel4500.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };
};
