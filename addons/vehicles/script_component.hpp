#define COMPONENT vehicles
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_VEHICLES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_VEHICLES
    #define DEBUG_SETTINGS DEBUG_ENABLED_VEHICLES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define FUEL_FACTOR 0.165    // fuel capacity = range in km * FUEL_FACTOR
#define STARTUP_DELAY 1.3
