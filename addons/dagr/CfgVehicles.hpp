class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(menu) {
                    displayName = CSTRING(ConfigureDAGR);
                    condition = QUOTE([ARR_2(_player,'ACE_DAGR')] call EFUNC(common,hasItem));
                    statement = QUOTE(call FUNC(menuInit));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QPATHTOF(UI\DAGR_Icon.paa);
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    class GVAR(toggle) {
                        displayName = CSTRING(ToggleDAGR);
                        condition = QUOTE([ARR_2(_player,'ACE_DAGR')] call EFUNC(common,hasItem));
                        statement = QUOTE(call FUNC(toggleOverlay));
                        showDisabled = 0;
                        priority = 0.2;
                        icon = QPATHTOF(UI\DAGR_Icon.paa);
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_DAGR: Item_Base_F {
        author[] = {"Rosuto", "Ruthberg"};
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(Name);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_DAGR,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_DAGR,6);
        };
    };
};
