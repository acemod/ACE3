class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleSitting: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(ModuleDisplayName);
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 1;
        isSingular = 1;
        icon = QUOTE(PATHTOF(UI\Icon_Module_Sitting_ca.paa));
        class Arguments {
            class enable {
                displayName = CSTRING(Enable);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDescription);
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(Stand) {
                displayName = CSTRING(Stand);
                condition = QUOTE(_player call FUNC(canStand));
                exceptions[] = {"isNotSitting"};
                statement = QUOTE(_player call FUNC(stand));
                priority = 0;
                icon = PATHTOF(UI\stand_ca.paa);
            };
        };
    };

    class ThingX;
    // Folding Chair
    class Land_CampingChair_V1_F: ThingX {
        XEH_ENABLED;
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, -0.1, -0.45};
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };
    // Camping Chair
    class Land_CampingChair_V2_F: ThingX {
        XEH_ENABLED;
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, -0.1, -0.45};
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };

    class Furniture_base_F;
    // Chair (Plastic)
    class Land_ChairPlastic_F: Furniture_base_F {
        XEH_ENABLED;
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 90;
        GVAR(sitPosition[]) = {0, 0, -0.5};
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 270;
    };
    // Chair (Wooden)
    class Land_ChairWood_F: Furniture_base_F {
        XEH_ENABLED;
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, -0.05, 0};
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };
    // Office Chair
    class Land_OfficeChair_01_F: Furniture_base_F {
        XEH_ENABLED;
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, 0, -0.6};
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };
    // Rattan Chair
    class Land_RattanChair_01_F: Furniture_base_F {
        XEH_ENABLED;
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, -0.1, -1}; // Z must be -1 due to chair's geometry (magic floating seat point)
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };
};
