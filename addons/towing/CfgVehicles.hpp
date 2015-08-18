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
};
