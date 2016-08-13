class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_wirecutter: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(wirecutterName);
        descriptionShort = CSTRING(wirecutterDescription);
        model = QPATHTOF(data\ace_wirecutter.p3d);
        picture = QPATHTOF(ui\item_wirecutter_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
};
