class CBA_Extended_EventHandlers;

class CfgVehicles {
    class ACE_Module;
    class ACEX_ModuleSitting: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACEX";
        displayName = CSTRING(ModuleDisplayName);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Sitting_ca.paa));
        class Arguments {
            class enable {
                displayName = CSTRING(Enable);
                description = CSTRING(Enable);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };
    class ACE_ModuleSitting: ACEX_ModuleSitting {
        scope = 1; // hiden, backwards compatibility
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class XGVAR(Stand) {
                displayName = CSTRING(Stand);
                condition = QUOTE(_player call FUNC(canStand));
                exceptions[] = {"isNotSitting"};
                statement = QUOTE(_player call FUNC(stand));
                priority = 0;
                icon = QUOTE(PATHTOF(UI\stand_ca.paa));
            };
        };
    };

    // Folding Chair
    class ThingX;
    class Land_CampingChair_V1_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = {0, -0.1, -0.45};
        XGVAR(interactPosition)[] = {0, 0, 0.3};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    // Camping Chair
    class Land_CampingChair_V2_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = {0, -0.1, -0.45};
        XGVAR(interactPosition)[] = {0, 0, 0.3};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    // Chair (Plastic)
    class Furniture_base_F: ThingX {};
    class Land_ChairPlastic_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 90;
        XGVAR(sitPosition)[] = {0, 0, -0.5};
        XGVAR(interactPosition)[] = {0, 0, 0.3};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 270;
    };

    // Chair (Wooden)
    class Land_ChairWood_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = {0, -0.05, 0};
        XGVAR(interactPosition)[] = {0, 0, 0.8};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    // Office Chair
    class Land_OfficeChair_01_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = {0, 0, -0.6};
        XGVAR(interactPosition)[] = {0, 0, 0.3};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    // Wooden Log
    class Land_WoodenLog_F: ThingX {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 0;
        XGVAR(sitPosition)[] = {0, 0, -1};
        XGVAR(interactPosition)[] = {0, 0, 0.5};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    // Rattan Chair
    class Land_RattanChair_01_F: Furniture_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = {0, 0, -1}; // Z must be -1 due to chair's geometry (magic floating seat point)
        XGVAR(interactPosition)[] = {0, 0, 0.3};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    // Arm Chair
    class Furniture_Residental_base_F;
    class Land_ArmChair_01_F: Furniture_Residental_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };

        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 0;
        XGVAR(sitPosition)[] = {0, 0, -1};
        XGVAR(interactPosition)[] = {0, 0, 0.3};

        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;

    };

    // Benches
    class House_Small_F;
    class Land_Bench_01_F: House_Small_F {
        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = { {0.5, -0.04, -0.90}, {-0.5, -0.04, -0.90} };
        XGVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };
    };

    class Land_Bench_02_F: House_Small_F {
        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = { {0.5, -0.04, -0.90}, {-0.5, -0.04, -0.90} };
        XGVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };
    };

    class Land_Bench_03_F: House_Small_F {
        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = { {0.5, -0.15, -0.90}, {-0.5, -0.15, -0.90} };
        XGVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };
    };

    /* Disabled due to a geometry issue with height
    class Land_Bench_04_F: House_Small_F {
        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 180;
        XGVAR(sitPosition)[] = { {0.5, -0.04, -2.00}, {-0.5, -0.04, -2.00} };
        XGVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };
    };*/

    class Land_Bench_05_F: House_Small_F {
        XGVAR(canSit) = 1;
        XGVAR(sitDirection) = 0;
        XGVAR(sitPosition)[] = { {0.5, -0.04, -0.90}, {-0.5, -0.04, -0.90} };
        XGVAR(interactPosition)[] = { {0.5, 0, 0.3}, {-0.5, 0, 0.3} };
    };
};
