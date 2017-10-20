#define COMPONENT rangecard
#define COMPONENT_BEAUTIFIED Range Card
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_RANGECARD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RANGECARD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_RANGECARD
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define MOA_TO_MRAD(d) (d * 3.43774677) // Conversion factor: 54 / (5 * PI)
#define MRAD_TO_MOA(d) (d * 0.29088821) // Conversion factor: (5 * PI) / 54
#define DEG_TO_MOA(d) (d * 60) // Conversion factor: 60
#define MOA_TO_DEG(d) (d / 60) // Conversion factor: 1 / 60
#define DEG_TO_MRAD(d) (d * 17.45329252) // Conversion factor: (50 * PI) / 9
#define MRAD_TO_DEG(d) (d / 17.45329252) // Conversion factor: 9 / (50 * PI)
