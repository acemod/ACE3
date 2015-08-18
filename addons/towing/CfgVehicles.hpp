#define MACRO_TOWING_ACTIONS \
        class ACE_Actions : ACE_Actions { \
            class ACE_MainActions : ACE_MainActions { \
                class GVAR(tilting) { \
                    displayName = CSTRING(TiltingAction); \
                    distance = TOWING_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canConnect)); \
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(connect)); \
                    exceptions[] = {"isNotInside"}; \
                }; \
                class GVAR(tiltingFinished) { \
                    displayName = CSTRING(TiltingFinishedAction); \
                    distance = TOWING_DISTANCE; \
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canCutTiltRope)); \
                    statement = QUOTE([ARR_1(_player)] call FUNC(cutTiltRope)); \
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
