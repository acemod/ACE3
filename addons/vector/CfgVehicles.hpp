class CfgVehicles {
    class Item_Base_F;
    class ACE_Item_Vector: Item_Base_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(VectorName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Vector,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Vector,6);
        };
    };
};
