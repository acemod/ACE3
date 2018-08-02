
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(place) {
                    displayName = CSTRING(Placedown);
                    condition = QUOTE([ARR_2(_player,'ACE_Tripod')] call EFUNC(common,hasItem));
                    statement = QUOTE([ARR_2(_player,'ACE_Tripod')] call FUNC(place));
                    showDisabled = 0;
                    icon = QPATHTOF(UI\w_sniper_tripod_ca.paa);
                };
            };
        };
    };

    class Item_Base_F;
    class ACE_Item_Tripod: Item_Base_F {
        author[] = {"Rocko", "Scubaman3D"};
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(DisplayName);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_Tripod,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_Tripod,2);
        };
    };

    class ThingX;
    class ACE_TripodObject: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,1,0};
        EGVAR(dragging,dragDirection) = 0;
        scope = 2;
        displayName = CSTRING(DisplayName);
        model = QPATHTOF(data\sniper_tripod.p3d);
        icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";

        class AnimationSources {
            class slide_down_tripod {
                source = "user";
                animPeriod = 0.02;
                initPhase = 0.5;
                minValue = 0;
                maxValue = 1;
            };
            class retract_leg_1: slide_down_tripod {};
            class retract_leg_2: retract_leg_1 {};
            class retract_leg_3: retract_leg_2 {};
        };

        class ACE_Actions {
            class ACE_MainActions {
                selection = "interaction_point";
                distance = 5;
                condition = "(true)";

                class ACE_Pickup {
                    selection = "";
                    displayName = CSTRING(PickUp);
                    distance = 5;
                    condition = "(true)";
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(pickup));
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = QPATHTOF(UI\w_sniper_tripod_ca.paa);
                };

                class ACE_Adjust {
                    selection = "";
                    displayName = CSTRING(Adjust);
                    distance = 5;
                    condition = "(true)";
                    //wait a frame to handle "Do When releasing action menu key" option:
                    statement = QUOTE([ARR_2({_this call FUNC(adjust)}, [ARR_2(_player,_target)])] call CBA_fnc_execNextFrame);
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = QPATHTOF(UI\w_sniper_tripod_ca.paa);
                };
            };
        };

        editorCategory = "EdCat_Supplies";
        editorSubcategory = QEGVAR(main,subcategory);
        editorPreview = QPATHTOF(data\preview_tripod.jpg);
    };
};
