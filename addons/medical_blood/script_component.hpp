#define COMPONENT medical_blood
#define COMPONENT_BEAUTIFIED Medical Blood
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_BLOOD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_BLOOD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_BLOOD
#endif

#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#define BLOOD_DISABLED     0
#define BLOOD_ONLY_PLAYERS 1
#define BLOOD_ENABLED      2
