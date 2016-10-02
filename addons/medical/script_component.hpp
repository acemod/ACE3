#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical Core
#include "\z\ace\addons\main\script_mod.hpp"

//#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// scale received pain to 0-2 level to select type of scream
// below 0.33: 0, from 0.34 to 0.66: 1, more than 0.67: 2
#define PAIN_TO_MOAN(pain) (floor (3 * pain) min 2)
