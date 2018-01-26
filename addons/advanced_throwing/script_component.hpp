#define COMPONENT advanced_throwing
#define COMPONENT_BEAUTIFIED Advanced Throwing
#include "\z\ace\addons\main\script_mod.hpp"

// #define DRAW_THROW_PATH
// #define ALLOW_QUICK_THROW
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ADVANCED_THROWING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ADVANCED_THROWING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ADVANCED_THROWING
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define THROWSTYLE_NORMAL_DIR [0, 70, 500]
#define THROWSTYLE_HIGH_DIR [0, 200, 500]
#define THROWSTYLE_HIGH_VEL_COEF 2
#define THROWSTYLE_DROP_VEL 2
#define THROWSTYLE_HIGH_TORQUE_COEF .6
#define THROWSTYLE_DROP_TORQUE_COEF .2

#define THROW_TYPE_DEFAULT "normal"
#define THROW_SPEED_DEFAULT 18
#define DROP_DISTANCE_DEFAULT 0.2

#define PICK_UP_DISTANCE 10
