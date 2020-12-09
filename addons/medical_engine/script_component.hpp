#define COMPONENT medical_engine
#define COMPONENT_BEAUTIFIED Medical Engine
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_ENGINE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_ENGINE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_ENGINE
#endif

#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "\z\ace\addons\main\script_macros.hpp"
#include "\z\ace\addons\medical_engine\script_macros_config.hpp"

#define PRELOAD_CLASS(class) \
    TRACE_1("Starting preload",class);\
    [{\
        1 preloadObject _this;\
    }, {\
        TRACE_1("Preload done",_this);\
    }, class] call CBA_fnc_waitUntilAndExecute

#define PRIORITY_HEAD       3
#define PRIORITY_BODY       4
#define PRIORITY_LEFT_ARM   (1 + random 1)
#define PRIORITY_RIGHT_ARM  (1 + random 1)
#define PRIORITY_LEFT_LEG   (1 + random 1)
#define PRIORITY_RIGHT_LEG  (1 + random 1)

// don't change, these reflect hard coded engine behaviour
#define DAMAGED_MIN_THRESHOLD 0.45
#define LIMPING_MIN_DAMAGE 0.5
