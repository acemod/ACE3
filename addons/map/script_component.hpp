#define COMPONENT map
#define COMPONENT_BEAUTIFIED Map
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MAP
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAP
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAP
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define MARKERNAME_MAPTOOL_FIXED "ACE_MapToolFixed"
#define MARKERNAME_MAPTOOL_ROTATINGNORMAL "ACE_MapToolRotatingNormal"
#define MARKERNAME_MAPTOOL_ROTATINGSMALL "ACE_MapToolRotatingSmall"
