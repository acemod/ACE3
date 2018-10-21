
class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_SpottingScope: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DisplayName);
        descriptionShort = "";
        picture = QPATHTOF(UI\w_spottingscope_ca.paa);
        model = QPATHTOF(data\ace_spottingscope.p3d);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 40;
        };
    };
};
