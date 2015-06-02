class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Sandbags {
                displayName = $STR_ACE_AC_BUILD;
                condition = QUOTE(call FUNC(canDeploy));
                statement = QUOTE(call FUNC(deploy));
                exceptions[] = {"isNotSwimming", "isNotInside"};
                showDisabled = 1;
                priority = 4;
                icon = PATHTOF(UI\icon_sandbag_ca.paa);
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Sandbag_empty: Item_Base_F {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_ACE_M_SBEMPTY";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_Sandbag_empty {
                name = "ACE_Sandbag_empty";
                count = 1;
            };
        };
    };
    /*
    class ACE_Item_Sandbag: Item_Base_F {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        scopeCurator = 2;
        displayName = "$STR_ACE_Sandbag";
        vehicleClass = "Items";
        class TransportItems {
            class ACE_Sandbag {
                name = "ACE_Sandbag";
                count = 1;
            };
        };
    };
    */
    class thingX;
    class ACE_SandbagObject: thingX {
        author = "$STR_ACE_Common_ACETeam";
        XEH_ENABLED;
        scope = 1;
        side = -1;
        model = PATHTOF(data\ace_sandbag_build.p3d);
        icon = "";
        displayName = $STR_ACE_Sandbag;
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition[]) = {0,0.8,0};
        EGVAR(dragging,dragDirection) = 0;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
                class ACE_PickUp {
                    selection = "";
                    displayName = "$STR_ACE_AC_PICKUPSB";
                    distance = 4;
                    condition = QUOTE(!(_player getVariable [ARR_2('ace_sandbag_usingSandbag',false)]));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(pickup));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                    icon = PATHTOF(UI\icon_sandbag_ca.paa);
                };
            };
        };
    };    
    
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Sandbag_empty,50);
        };
    };
};
