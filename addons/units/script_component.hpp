#define COMPONENT units
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_UNITS
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_UNITS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_UNITS
#endif

#define SPEED_KMH 0
#define SPEED_MPH 1
#define SPEED_KNOT 2
#define SPEED_MS 3

#define ALT_M 0
#define ALT_F 1

#define MODE_ATL 0
#define MODE_ASL 1

#include "\z\ace\addons\main\script_macros.hpp"
