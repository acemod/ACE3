#define COMPONENT dagr
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_DAGR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_DAGR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DAGR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DEG_TO_MIL(d) (d / 360 * 6400)
#define MIL_TO_DEG(d) (d / 6400 * 360)
