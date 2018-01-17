class CfgVehicles {
    class Item_Base_F;
    class ACE_Item_Yardage450: Item_Base_F {
        author[] = {"Spooner", "tcp"};
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(DisplayName);
        vehicleClass = "Items";
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Yardage450,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Yardage450,4);
        };
    };
};
