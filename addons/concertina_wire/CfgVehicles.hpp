
class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Fence;
    class ACE_ConcertinaWireNoGeo: Fence {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        scope = 1;
        displayName = "";
        model = QPATHTOF(data\ACE_ConcertinaWireNoGeo.p3d);
        destrType = "DestructTent";
        accuracy = 0.3;
        mapSize = 2.8;
        animated = 1;
        autocenter = 0;
        armor = 200;
        class AnimationSources {
            class fix1 {
                source = "user";
                animPeriod = 1e-007;
                initPhase = 0;
            };
            class fix2: fix1 {};
            class fix3: fix1 {};
            class fix4: fix1 {};
            class rotate {
                source = "user";
                animPeriod = 1e-007;
            };
            class wire_2 {
                source = "user";
                animPeriod = 1e-007;
            };
            class wire_3: wire_2{};
            class wire_4: wire_2{};
            class wire_5: wire_2{};
            class wire_6: wire_2{};
            class wire_7: wire_2{};
            class wire_8: wire_2{};
            class wire_9: wire_2{};
            class wire_10: wire_2{};
            class wire_11: wire_2{};
            class wire_12: wire_2{};
            class wire_13: wire_2{};
            class wire_14: wire_2{};
            class wire_15: wire_2{};
            class wire_16: wire_2{};
            class wire_17: wire_2{};
            class wire_18: wire_2{};

            class wire_2_1: wire_2 {
                animPeriod = 8;
            };
            class wire_3_1: wire_2_1 {};
            class wire_4_1: wire_2_1 {};
            class wire_5_1: wire_2_1 {};
            class wire_6_1: wire_2_1 {};
            class wire_7_1: wire_2_1 {};
            class wire_8_1: wire_2_1 {};
            class wire_9_1: wire_2_1 {};
            class wire_10_1: wire_2_1 {};
            class wire_11_1: wire_2_1 {};
            class wire_12_1: wire_2_1 {};
            class wire_13_1: wire_2_1 {};
            class wire_14_1: wire_2_1 {};
            class wire_15_1: wire_2_1 {};
            class wire_16_1: wire_2_1 {};
            class wire_17_1: wire_2_1 {};
            class wire_18_1: wire_2_1 {};
        };
    };
    class ACE_ConcertinaWire: ACE_ConcertinaWireNoGeo {
        scope = 2;
        displayName = CSTRING(DisplayName);
        model = QPATHTOF(data\ACE_ConcertinaWire.p3d);
        EGVAR(logistics_wirecutter,isFence) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 5;
                condition = "true";
                class ACE_Dismount {
                    selection = "";
                    displayName = CSTRING(UnrollWire);
                    distance = 5;
                    condition = "alive _target";
                    statement = QUOTE([ARR_2(_target,_player)] call FUNC(dismount));
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                };
            };
        };
    };

    class ThingX;
    class ACE_ConcertinaWireCoil: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        scope = 2;
        displayName = CSTRING(Coil_DisplayName);
        model = QPATHTOF(data\ACE_ConcertinaWireCoil.p3d);
        mapsize = 0.5;
        animated = 0;
        nameSound = "fence";
        typicalCargo[] = {};
        transportAmmo = 0;
        transportRepair = 0;
        transportFuel = 0;
        cost = 0;
        armor = 1000;
        destrType = "DestructNo";
        accuracy = 1000;
        autocenter = 0;
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0,0.5,0.5};
        EGVAR(dragging,dragDirection) = 0;
        EGVAR(cargo,size) = 1;
        EGVAR(cargo,canLoad) = 1;
        class ACE_Actions {
            class ACE_MainActions {
                selection = "";
                distance = 4;
                condition = "true";
                class ACE_Deploy {
                    selection = "";
                    displayName = CSTRING(RollWire);
                    distance = 4;
                    condition = "true";
                    //wait a frame to handle "Do When releasing action menu key" option:
                    statement = QUOTE([ARR_2({_this call FUNC(deploy)}, [ARR_2(_target,_player)])] call CBA_fnc_execNextFrame);
                    showDisabled = 0;
                    exceptions[] = {};
                    icon = QPATHTOF(UI\icon_sandbag_ca.paa);
                };
            };
        };
    };

    class NonStrategic;
    class Land_Razorwire_F: NonStrategic {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
};
