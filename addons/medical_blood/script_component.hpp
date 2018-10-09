#define COMPONENT medical_blood
#define COMPONENT_BEAUTIFIED Medical Blood
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_ENABLED_MEDICAL_BLOOD
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_BLOOD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_BLOOD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_BLOOD
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MAX_BLOOD_OBJECTS 500
#define BLOOD_OBJECT_LIFETIME 900
