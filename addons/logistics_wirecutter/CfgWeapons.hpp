class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_wirecutter: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(wirecutterName);
        descriptionShort = CSTRING(wirecutterDescription);
        model = QPATHTOF(data\ace_wirecutter.p3d);
        picture = QPATHTOF(ui\item_wirecutter_ca.paa);
        ACE_isWirecutter = 1;
        ACE_isTool = 1;
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };
};
