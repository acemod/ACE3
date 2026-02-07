class CBA_Extended_EventHandlers_base;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(place) {
                displayName = CSTRING(deploySandbag);
                condition = QUOTE(call FUNC(canDeploy));
                // Wait a frame to handle "Do When releasing action menu key" option
                statement = QUOTE([ARR_2(LINKFUNC(deploy),_this)] call CBA_fnc_execNextFrame);
                exceptions[] = {"isNotSwimming"};
                showDisabled = 0;
                icon = QPATHTOF(UI\icon_sandbag_ca.paa);
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
        editorCategory = "EdCat_Equipment";
        editorSubcategory = "EdSubcat_InventoryItems";
        editorPreview = QPATHTOF(data\preview_sandbag.jpg);
        class TransportItems {
            MACRO_ADDITEM(ACE_Sandbag_empty,1);
        };
    };

    class ThingX;
    class ACE_SandbagObject: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers_base {};
        };

        author = ECSTRING(common,ACETeam);
        scope = 2;
        side = 3;
        model = QPATHTOF(data\ace_sandbag_build.p3d);
        displayName = CSTRING(sandbag_displayName);
        vehicleClass = "ACE_Logistics_Items";
        typicalCargo[] = {};
        armor = 12000; // Withstand 200 5.56 bullets before sandbag hull is cheese
        mapSize = 0.4;
        nameSound = "Bunker";
        icon = QPATHTOF(UI\icon_sandbag_ca.paa);
        accuracy = 1000;
        destrType = "DestructDefault";

        EGVAR(dragging,canCarry) = 1;

        class DestructionEffects {};

        class Damage {
            tex[] = {};
            mat[] = {
                QPATHTO_R(data\bag_destruct.rvmat),
                QPATHTO_R(data\bag_destruct.rvmat),
                QPATHTO_R(data\bag_destruct.rvmat)
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
                    condition = QUOTE(!(_player getVariable [ARR_2(QQGVAR(isUsingSandbag),false)]));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(pickup));
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                };
            };
        };

        editorCategory = "EdCat_Supplies";
        editorSubcategory = QEGVAR(main,subcategory);
        editorPreview = QPATHTOF(data\preview_sandbag.jpg);
    };

    class ACE_SandbagObject_NoGeo: ACE_SandbagObject {
        scope = 1;
        model = QPATHTOF(data\ace_sandbag_nogeo.p3d);

        class EventHandlers: EventHandlers {
            class CBA_Extended_EventHandlers {};
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Sandbag_empty,50);
        };
    };
};
