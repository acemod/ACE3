#define COMPONENT medical_vitals
#define COMPONENT_BEAUTIFIED Medical Vitals
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_VITALS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_VITALS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_VITALS
#endif

#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#define BASE_OXYGEN_USE -0.25
