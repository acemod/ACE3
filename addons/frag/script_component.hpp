#define COMPONENT frag
#include "\z\ace\addons\main\script_mod.hpp"

//#define DEBUG_ENABLED_FRAG

#ifdef DEBUG_ENABLED_FRAG
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FRAG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FRAG
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ACE_TRACE_DRAW_INC    1