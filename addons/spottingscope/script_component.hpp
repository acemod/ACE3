#define COMPONENT spottingscope
#define COMPONENT_BEAUTIFIED Spotting Scope
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
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

#define MAGIC_SCOPE_NUMBER 0.0235
//#define MAGIC_SCOPE_NUMBER (uiNamespace getVariable ['magic', 1])

#define POS_X_BASE(size) safezoneX + 0.5 * safezoneW - 0.5 * (size) / (getResolution select 5)
#define POS_Y_BASE(size) safezoneY + 0.5 * safezoneH - 0.5 * (size) / (getResolution select 5) * 4/3
#define POS_W_BASE(size) (size) / (getResolution select 5)
#define POS_H_BASE(size) (size) / (getResolution select 5) * 4/3

#define SIZEX 1.05

#define POS_X QUOTE(POS_X_BASE(SIZEX))
#define POS_Y QUOTE(POS_Y_BASE(SIZEX))
#define POS_W QUOTE(POS_W_BASE(SIZEX))
#define POS_H QUOTE(POS_H_BASE(SIZEX))
