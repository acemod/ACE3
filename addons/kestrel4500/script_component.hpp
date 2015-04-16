#define COMPONENT kestrel4500
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_KESTREL4500
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_KESTREL4500
    #define DEBUG_SETTINGS DEBUG_SETTINGS_KESTREL4500
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define GET_TEMPERATURE_AT_HEIGHT(h) (EGVAR(weather,currentTemperature) - 0.0065 * (h))
