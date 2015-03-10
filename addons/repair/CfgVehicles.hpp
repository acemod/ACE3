
#define MACRO_REPAIRVEHICLE \
    class ACE_Actions { \
        class ACE_MainActions { \
            class GVAR(Repair) { \
                displayName = "$STR_AGM_Repair_Repair"; \
                condition = QUOTE([ARR_2(_player, _target)] call DFUNC(canRepair)); \
                statement = QUOTE([ARR_2(_player, _target)] call DFUNC(repair);); \
                showDisabled = 0; \
                priority = 2; \
                icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"; \
                distance = 4; \
            }; \
        }; \
    };

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Tank: LandVehicle {
        MACRO_REPAIRVEHICLE
    };

    class Air;
    class Helicopter: Air {
        MACRO_REPAIRVEHICLE
    };

    class Plane: Air {
        MACRO_REPAIRVEHICLE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_REPAIRVEHICLE
    };
};
