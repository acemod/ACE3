#define COMPONENT bft_devices
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_BFT_DEVICES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_BFT_DEVICES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BFT_DEVICES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\z\ace\addons\bft\device_getters.hpp"

#include "ifOpen_macros.hpp"