#define COMPONENT gunbag
#include "\z\ace\addons\main\script_mod.hpp"

//#define DEBUG_ENABLED_GUNBAG
//#define DISABLE_COMPILE_CACHE
//#define CBA_DEBUG_SYNCHRONOUS
//#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_GUNBAG
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GUNBAG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_GUNBAG
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define CLASSNAME ACE_Gunbag
#define PROGRESSBAR_TIME 5
