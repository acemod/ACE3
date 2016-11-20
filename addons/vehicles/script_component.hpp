#define COMPONENT vehicles
#define COMPONENT_BEAUTIFIED Vehicles
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_VEHICLES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_VEHICLES
    #define DEBUG_SETTINGS DEBUG_ENABLED_VEHICLES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define FUEL_FACTOR 0.165    // fuel capacity = range in km * FUEL_FACTOR
#define STARTUP_DELAY 1.3
