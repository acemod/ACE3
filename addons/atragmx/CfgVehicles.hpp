class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) {
                    displayName = CSTRING(OpenATragMXDialog);
                    condition = QUOTE(call FUNC(can_show));
                    statement = QUOTE(call FUNC(create_dialog));
                    showDisabled = 0;
                    icon = QPATHTOF(UI\ATRAG_Icon.paa);
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_ATragMX: Item_Base_F {
        author = "Ruthberg";
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Name);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_ATragMX,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_ATragMX,6);
        };
    };
};
