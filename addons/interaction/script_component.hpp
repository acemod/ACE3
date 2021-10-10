#define COMPONENT interaction
#define COMPONENT_BEAUTIFIED Interaction
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_INTERACTION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INTERACTION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INTERACTION
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define IDD_MOUSEHINT 2400
#define IDC_MOUSEHINT_LMB 2410
#define IDC_MOUSEHINT_LMB_TEXT 2420
#define IDC_MOUSEHINT_MMB 2430
#define IDC_MOUSEHINT_MMB_TEXT 2450
#define IDC_MOUSEHINT_RMB 2460
#define IDC_MOUSEHINT_RMB_TEXT 2470

#define IDC_MOUSEHINT_EXTRA 2500
#define IDC_MOUSEHINT_EXTRA_NAME 2510
#define IDC_MOUSEHINT_EXTRA_TEXT 2520

#define MACRO_DOOR_REACH_DISTANCE (AGLToASL positionCameraToWorld [0,0,0] vectorDistance ACE_player modelToWorldWorld (ACE_player selectionPosition "Head")) + 2

#define DISABLED_LAMP_DAMAGE 0.95
