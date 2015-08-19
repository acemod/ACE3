#define MACRO_TOWING_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(TiltConnect) { \
                    displayName = CSTRING(TiltConnect); \
                    distance = TOWING_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canConnectTiltCable)); \
                    statement = QUOTE(_this call FUNC(connectTiltCable)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
                class GVAR(TiltDisconnect) { \
                    displayName = CSTRING(TiltDisconnect); \
                    distance = TOWING_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canDisconnectTiltCable)); \
                    statement = QUOTE(_player call FUNC(disconnectTiltCable)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
                class GVAR(TowConnect) { \
                    displayName = CSTRING(TowConnect); \
                    distance = TOWING_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canConnectTowBar)); \
                    statement = QUOTE(_this call FUNC(connectTowBar)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
                class GVAR(TowDisconnect) { \
                    displayName = CSTRING(TowDisconnect); \
                    distance = TOWING_ACTION_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canDisconnectTowBar)); \
                    statement = QUOTE(_player call FUNC(disconnectTowBar)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
            }; \
        };

class CfgVehicles {
    class LandVehicle;
    class Car : LandVehicle {
        MACRO_TOWING_ACTIONS
    };

    class Tank : LandVehicle {
        MACRO_TOWING_ACTIONS
    };

    class StaticWeapon : LandVehicle {
        MACRO_TOWING_ACTIONS
    };

    class Air;
    class Helicopter : Air {
        MACRO_TOWING_ACTIONS
    };

    class Plane : Air {
        MACRO_TOWING_ACTIONS
    };

    class Ship;
    class Ship_F : Ship {
        MACRO_TOWING_ACTIONS
    };
};
