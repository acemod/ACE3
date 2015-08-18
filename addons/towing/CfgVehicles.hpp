#define MACRO_TOWING_ACTIONS \
        class ACE_Actions { \
            class ACE_MainActions { \
                class GVAR(Tilting) { \
                    displayName = CSTRING(TiltingAction); \
                    distance = TOWING_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canConnect)); \
                    statement = QUOTE(_this call FUNC(connect)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
                class GVAR(TiltingFinished) { \
                    displayName = CSTRING(TiltingFinishedAction); \
                    distance = TOWING_DISTANCE; \
                    condition = QUOTE(_this call FUNC(canCutTiltRope)); \
                    statement = QUOTE(_player call FUNC(cutTiltRope)); \
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
