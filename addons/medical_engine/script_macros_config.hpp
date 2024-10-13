/*
    Usage:

    #include "\z\ace\addons\medical_engine\script_macros_config.hpp"

    class CfgVehicles {
        class My_AwesomeUnit_base;
        class My_AwesomeUnit: My_AwesomeUnit_base {
            class HitPoints {
                class HitHands;
                class HitLegs;
                ADD_ACE_HITPOINTS;
            };
        };
    };
*/

// Our method for adding left and right arm and leg armor. Uses those selections
// that are used for animations and therefore exist in all third party units.
// This used to take the armor values as parameters; it now inherits the values
// of `armor`, `passThrough` and `explosionShielding` from the existing hitpoints
// for vanilla consistency.
#define ADD_ACE_HITPOINTS\
    class HitLeftArm: HitHands {\
        material = -1;\
        name = "hand_l";\
        radius = 0.08;\
        visual = "injury_hands";\
        minimalHit = 0.01;\
    };\
    class HitRightArm: HitLeftArm {\
        name = "hand_r";\
    };\
    class HitLeftLeg: HitLegs {\
        material = -1;\
        name = "leg_l";\
        radius = 0.1;\
        visual = "injury_legs";\
        minimalHit = 0.01;\
    };\
    class HitRightLeg: HitLeftLeg {\
        name = "leg_r";\
    }
