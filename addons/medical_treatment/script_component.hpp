#define COMPONENT medical_treatment
#define COMPONENT_BEAUTIFIED Medical Treatment
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_TREATMENT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_TREATMENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_TREATMENT
#endif

#include "\z\ace\addons\main\script_macros.hpp"
#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
