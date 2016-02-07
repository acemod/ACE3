class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_wirecutter: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(wirecutterName);
        descriptionShort = CSTRING(wirecutterDescription);
        model = QUOTE(PATHTOF(data\ace_wirecutter.p3d));
        picture = QUOTE(PATHTOF(ui\item_wirecutter_ca.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 65;
        };
    };
};
