#define COMPONENT optionsmenu
#define COMPONENT_BEAUTIFIED Options Menu

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_OPTIONSMENU
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_OPTIONSMENU
    #define DEBUG_SETTINGS DEBUG_SETTINGS_OPTIONSMENU
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define IDC_MAIN_INFO 80090
#define IDC_MAIN_INFO_CURRENT_VERSION_INFO 80091
#define IDC_MAIN_INFO_NEWEST_VERSION_INFO 80092
