#define COMPONENT medical_statemachine
#define COMPONENT_BEAUTIFIED Medical State Machine
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_STATEMACHINE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_STATEMACHINE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_STATEMACHINE
#endif

#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#define FATAL_INJURIES_ALWAYS 0
#define FATAL_INJURIES_CRDC_ARRST 1
#define FATAL_INJURIES_NEVER 2
