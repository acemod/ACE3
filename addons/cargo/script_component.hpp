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

#define MAX_LOAD_DISTANCE 5

#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})

#define CARGO_TUMBLE_RANDOM_MUL 8
#define CARGO_TUMBLE_TORQUE 500
