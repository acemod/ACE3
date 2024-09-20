#define COMPONENT repair
#define COMPONENT_BEAUTIFIED Repair
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_REPAIR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REPAIR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REPAIR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define TRACK_HITPOINTS ["hitltrack", "hitrtrack"]

#define DAMAGE_COLOR_SCALE ["#FFFFFF", "#FFFF7E", "#FFEC4D", "#FFD52C", "#FCB121", "#FF9916", "#FF7D16", "#FF4400", "#FF0000"]

#define IN_REPAIR_FACILITY_CACHE_EXPIRY 1

#define NEAR_REPAIR_VEHICLE_CACHE_EXPIRY 1

#define ANY_TOOLKIT_FAKECLASS QGVAR(anyToolKit)

#define PATCH_WHEEL_STEP_TIME 0.05
