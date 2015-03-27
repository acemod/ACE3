class CfgWeapons {
    class InventoryItem_Base_F;
    class ACE_ItemCore;

    class ACE_key_master: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "Vehicle Key: Master";
        descriptionShort = "$STR_ACE_Vehicle_Item_Master_Description";
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QUOTE(PATHTOF(ui\keyBlack.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };
    class ACE_key_lockpick: ACE_key_master {
        displayName = "Lockpick";
        descriptionShort = "$STR_ACE_Vehicle_Item_Lockpick_Description";
        picture = QUOTE(PATHTOF(ui\lockpick.paa));
    };
    class ACE_key_west: ACE_key_master {
        displayName = "Vehicle Key: West";
        descriptionShort = "$STR_ACE_Vehicle_Item_West_Description";
        picture = QUOTE(PATHTOF(ui\keyBlue.paa));
    };
    class ACE_key_east: ACE_key_master {
        displayName = "Vehicle Key: East";
        descriptionShort = "$STR_ACE_Vehicle_Item_East_Description";
        picture = QUOTE(PATHTOF(ui\keyRed.paa));
    };
    class ACE_key_indp: ACE_key_master {
        displayName = "Vehicle Key: Independent";
        descriptionShort = "$STR_ACE_Vehicle_Item_Indp_Description";
        picture = QUOTE(PATHTOF(ui\keyPurple.paa));
    };
    class ACE_key_civ: ACE_key_master {
        displayName = "Vehicle Key: Civilian";
        descriptionShort = "$STR_ACE_Vehicle_Item_Civ_Description";
        picture = QUOTE(PATHTOF(ui\keyGreen.paa));
    };
};
