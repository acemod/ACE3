#define MACRO_SEAT_ACTION \
    class ACE_Actions { \
        class ACE_MainActions { \
            displayName = ECSTRING(interaction,MainAction); \
            selection = ""; \
            distance = 1.25; \
            condition = "true"; \
            class GVAR(Sit) { \
                displayName = CSTRING(Sit); \
                condition = QUOTE(_this call FUNC(canSit)); \
                statement = QUOTE(_this call FUNC(sit)); \
                showDisabled = 0; \
                priority = 0; \
                icon = PATHTOF(UI\sit_ca.paa); \
            }; \
        }; \
    };

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(Stand) {
                displayName = CSTRING(Stand);
                condition = QUOTE(_player call FUNC(canStand));
                statement = QUOTE(_player call FUNC(stand));
                priority = 0;
                //icon = PATHTOF(UI\sit_ca.paa);
                //add exception isNotSitting to everything that shouldn't be available (eg. medical)
            };
        };
    };

    class ThingX;
    // Folding Chair
    class Land_CampingChair_V1_F: ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, -0.1, -0.45};
    };
    // Camping Chair
    class Land_CampingChair_V2_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, -0.1, -0.45};
    };
    // Chair (Plastic)
    class Land_ChairPlastic_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 90;
        GVAR(sitPosition[]) = {-0.1, 0, -0.2};
    };
    // Chair (Wooden)
    class Land_ChairWood_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, 0, 0};
    };
    // Office Chair
    class Land_OfficeChair_01_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, 0, -0.6};
    };
    // Rattan Chair
    class Land_RattanChair_01_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0.07, 0.17, 1};
    };
    // Field Toilet
    class Land_FieldToilet_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, 0.75, -1.1};
    };
    // Toiletbox
    class Land_ToiletBox_F:  ThingX {
        XEH_ENABLED;
        MACRO_SEAT_ACTION
        GVAR(canSit) = 1;
        GVAR(sitDirection) = 180;
        GVAR(sitPosition[]) = {0, 0.75, -1.1};
    };
};
