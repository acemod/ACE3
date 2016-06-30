#define COMPONENT medical_state
#define COMPONENT_BEAUTIFIED Medical State Machine
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_STATE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_STATE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_STATE
#endif

#include "\z\ace\addons\main\script_macros.hpp"
