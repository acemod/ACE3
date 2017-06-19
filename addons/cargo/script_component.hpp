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

#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})

// Default cargo size is -1 as 0 is a valid size
#define CARGO_SIZE(classname) GET_NUMBER(configFile >> "CfgVehicles" >> (classname) >> QGVAR(size),-1)
#define CARGO_SPACE(classname) GET_NUMBER(configFile >> "CfgVehicles" >> (classname) >> QGVAR(space),0)
