/*
    Usage:

    #include "\z\ace\addons\medical_engine\script_macros_config.hpp"

    class CfgVehicles {
        class My_AwesomeUnit_base;
        class My_AwesomeUnit: My_AwesomeUnit_base {
            class HitPoints {
                ADD_ACE_HITPOINTS(2,2);
            };
        };
    };
*/

// Our method for adding left and right arm and leg armor. Uses those selections
// that are used for animations and therefore exist in all third party units
// usage: arm_armor and leg_armor are the armor values of of HitHands and
// HitLegs respectively.
// "ACE_HDBracket" is a special hit point. It is designed in a way where the
// "HandleDamage" event handler will compute it at the end of every damage
// calculation step. This way we can figure out which hit point took the most
// damage from one projectile and should be receiving the ACE medical wound.
// the hit point itself should not take any damage
// It is important that the "ACE_HDBracket" hit point is the last in the config,
// but has the same selection as the first one (always "HitHead" for soldiers).
#define ADD_ACE_HITPOINTS(arm_armor,leg_armor)\
    class HitLeftArm {\
        armor = arm_armor;\
        material = -1;\
        name = "hand_l";\
        passThrough = 1;\
        radius = 0.08;\
        explosionShielding = 1;\
        visual = "injury_hands";\
        minimalHit = 0.01;\
    };\
    class HitRightArm: HitLeftArm {\
        name = "hand_r";\
    };\
    class HitLeftLeg {\
        armor = leg_armor;\
        material = -1;\
        name = "leg_l";\
        passThrough = 1;\
        radius = 0.1;\
        explosionShielding = 1;\
        visual = "injury_legs";\
        minimalHit = 0.01;\
    };\
    class HitRightLeg: HitLeftLeg {\
        name = "leg_r";\
    };\
    class ACE_HDBracket {\
        armor = 1;\
        material = -1;\
        name = "head";\
        passThrough = 0;\
        radius = 1;\
        explosionShielding = 1;\
        visual = "";\
        minimalHit = 0;\
        depends = "HitHead";\
    }
