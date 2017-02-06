#define COMPONENT cargo
#define COMPONENT_BEAUTIFIED Cargo
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_CARGO
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_CARGO
    #define DEBUG_SETTINGS DEBUG_ENABLED_CARGO
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MAX_LOAD_DISTANCE 10
#define CARGO_VEHICLE_CLASSES ["Car", "Air", "Tank", "Ship", "Cargo_base_F", "Land_PaperBox_closed_F"]
