#define COMPONENT missile_hud
#define COMPONENT_BEAUTIFIED Missile HUD
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MISSILE_HUD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MISSILE_HUD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MISSILE_HUD
#endif

#include "\z\ace\addons\main\script_macros.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"

#define HUD_UPDATE_RATE 0.1
