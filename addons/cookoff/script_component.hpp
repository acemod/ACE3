#define COMPONENT cookoff
#define COMPONENT_BEAUTIFIED Cook off
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_COOKOFF
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COOKOFF
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COOKOFF
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define IS_EXPLOSIVE_AMMO(ammo) (getNumber (ammo call CBA_fnc_getObjectConfig >> "explosive") > 0.5)
