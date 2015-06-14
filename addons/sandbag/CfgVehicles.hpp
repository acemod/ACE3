class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Sandbags {
                displayName = CSTRING(DeploySandbag);
                condition = QUOTE(call FUNC(canDeploy));
                statement = QUOTE(call FUNC(deploy));
                exceptions[] = {"isNotSwimming"};
                showDisabled = 1;
                priority = 4;
                icon = PATHTOF(UI\icon_sandbag_ca.paa);
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Sandbag_empty: Item_Base_F {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(sandbagEmpty_displayName);
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
        author = ECSTRING(common,ACETeam);
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(sandbag_displayName);
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
        author = ECSTRING(common,ACETeam);
        XEH_ENABLED;
        scope = 1;
        side = -1;
        model = PATHTOF(data\ace_sandbag_build.p3d);
        displayName = CSTRING(sandbag_displayName);
        typicalCargo[] = {};
        armor = 12000; // Withstand 200 5.56 bullets before sandbag hull is cheese
        mapSize = 0.4;
        nameSound = "Bunker";
        icon = PATHTOF(UI\icon_sandbag_ca.paa);
        accuracy = 1000;

        destrType = "DestructDefault";

        class DestructionEffects {};
        class Damage {
            tex[] = {};
            mat[] = {
                "z\ace\addons\sandbag\data\bag_destruct.rvmat",
                "z\ace\addons\sandbag\data\bag_destruct.rvmat",
                "z\ace\addons\sandbag\data\bag_destruct.rvmat"
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
                class ACE_PickUp {
                    selection = "";
                    displayName = CSTRING(PICKUPSB);
                    distance = 4;
                    condition = QUOTE(!(_player getVariable [ARR_2('ace_sandbag_usingSandbag',false)]));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(pickup));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                    icon = PATHTOF(UI\icon_sandbag_ca.paa);
                };
                class ACE_Carry {
                    selection = "";
                    displayName = CSTRING(CARRYSB);
                    distance = 4;
                    condition = QUOTE(!(_player getVariable [ARR_2('ace_sandbag_usingSandbag',false)]));
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(carry));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                    icon = PATHTOF(UI\icon_sandbag_ca.paa);
                };
            };
        };
    };
    class ACE_SandbagObject_NoGeo: ACE_SandbagObject {
        scope = 1;
        model = PATHTOF(data\ace_sandbag_nogeo.p3d);
    };
    
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Sandbag_empty,50);
        };
    };
};
