#define COMPONENT spottingscope
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SPOTTINGSCOPE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPOTTINGSCOPE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPOTTINGSCOPE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define IDC_RETICLE 10000
#define IDC_BODY 10001
#define IDC_BLACK_LEFT 10002
#define IDC_BLACK_RIGHT 10003

#define SIZEX 0.75/(getResolution select 5)

#define POS_X QUOTE(safezoneX + 0.5 * safezoneW - 0.5 * SIZEX)
#define POS_Y QUOTE(safezoneY + 0.5 * safezoneH - 0.5 * SIZEX * 4/3)
#define POS_W QUOTE(SIZEX)
#define POS_H QUOTE(SIZEX * 4/3)
