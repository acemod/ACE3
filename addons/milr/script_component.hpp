#define COMPONENT milr
#define COMPONENT_BEAUTIFIED MILR
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS
#define ENABLE_QUICK_TESTING

#ifdef DEBUG_ENABLED_MILR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MILR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MILR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define RANGEFINDER_MAX_RANGE 3000

#define IDC_MILR_RANGE 90001
#define IDC_MILR_ELEV  90002

#define RANGE_NO_RETURNS -1
#define RANGE_TOO_CLOSE  -2
#define RANGE_IN_PROGRESS  -3
