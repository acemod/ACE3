#define COMPONENT headless
#define COMPONENT_BEAUTIFIED Headless
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HEADLESS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HEADLESS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HEADLESS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DELAY_DEFAULT 15
#define BLACKLIST_UAV "UAV", "UAV_AI_base_F", "B_UAV_AI", "O_UAV_AI", "I_UAV_AI"
