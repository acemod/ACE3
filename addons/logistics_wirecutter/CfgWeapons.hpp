class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_wirecutter: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_logistics_wirecutter_wirecutterName";
        descriptionShort = "$STR_ACE_logistics_wirecutter_wirecutterDescription";
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QUOTE(PATHTOF(ui\item_wirecutter_ca.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 100;
        };
    };
};
