#define COMPONENT vehicledamage
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_VEHICLEDAMAGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_VEHICLEDAMAGE
    #define DEBUG_SETTINGS DEBUG_ENABLED_VEHICLEDAMAGE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define CALL_EXT(x) "ace_vd" callExtension x
#define VECTOR_TEXT(x) ([(x)] call FUNC(_textVector))

#define DEBUG_EXTENSION_DYNLOAD
#define DEBUG_LOG_EXTENSION
#define DEBUG_DRAW_LINES
//#define DEBUG_EXTENSION_DYNLOAD_RELOAD
//#define DEBUG_VEHICLEDAMAGE_RENDER