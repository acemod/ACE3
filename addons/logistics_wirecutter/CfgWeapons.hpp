class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_wirecutter: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(wirecutterName);
        descriptionShort = CSTRING(wirecutterDescription);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QUOTE(PATHTOF(ui\item_wirecutter_ca.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 100;
        };
    };
};
