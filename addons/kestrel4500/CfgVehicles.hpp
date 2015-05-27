class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) {
                    displayName = CSTRING(OpenKestrel);
                    condition = QUOTE(call FUNC(canShow) && !GVAR(Kestrel4500));
                    statement = QUOTE(call FUNC(createKestrelDialog));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QUOTE(PATHTOF(UI\Kestrel4500_Icon.paa));
                    exceptions[] = {"notOnMap"};
                };
                class GVAR(show) {
                    displayName = CSTRING(ShowKestrel);
                    condition = QUOTE(call FUNC(canShow) && !GVAR(Overlay));
                    statement = QUOTE(call FUNC(displayKestrel));
                    showDisabled = 0;
                    priority = 0.2;
                    icon = QUOTE(PATHTOF(UI\Kestrel4500_Icon.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class GVAR(hide) {
                    displayName = CSTRING(HideKestrel);
                    condition = QUOTE(GVAR(Overlay));
                    statement = QUOTE(call FUNC(displayKestrel));
                    showDisabled = 0;
                    priority = 0.3;
                    icon = QUOTE(PATHTOF(UI\Kestrel4500_Icon.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Kestrel4500: Item_Base_F {
        author = "Ruthberg";
        scope = 2;
        scopeCurator = 2;
        displayName = "Kestrel 4500";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_Kestrel4500 {
                name = "ACE_Kestrel4500";
                count = 1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Kestrel4500,6);
        };
    };
};
