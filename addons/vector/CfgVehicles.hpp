
#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
    weapon = #WEAPON; \
    count = COUNT; \
}

class CfgVehicles {
    class Item_Base_F;
    class ACE_Item_Vector: Item_Base_F {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(VectorName);
        vehicleClass = "Items";
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Vector,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_Vector,6);
        };
    };
};
