#define MACRO_TILTING_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(connect) { \
                    displayName = CSTRING(Connect); \
                    distance = ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canConnectCable)); \
                    statement = QUOTE(_this call FUNC(connectCable)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
                class GVAR(disconnect) { \
                    displayName = CSTRING(Disconnect); \
                    distance = ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canDisconnectCable)); \
                    statement = QUOTE(_player call FUNC(disconnectCable)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
            }; \
        };

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        MACRO_TILTING_ACTIONS
    };

    class Tank: LandVehicle {
        MACRO_TILTING_ACTIONS
    };

    class StaticWeapon: LandVehicle {
        MACRO_TILTING_ACTIONS
    };

    class Air;
    class Helicopter: Air {
        MACRO_TILTING_ACTIONS
    };

    class Plane: Air {
        MACRO_TILTING_ACTIONS
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_TILTING_ACTIONS
    };
};
