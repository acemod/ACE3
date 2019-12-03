#define COMPONENT optics
#define COMPONENT_BEAUTIFIED Optics
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_OPTICS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_OPTICS
    #define DEBUG_SETTINGS DEBUG_ENABLED_OPTICS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define PIP(classname)\
    class TRIPLES(ACE,classname,PIP): TRIPLES(ACE,classname,2D) {\
        author = ECSTRING(common,ACETeam);\
        scope = 1;\
    \
        class ItemInfo: ItemInfo {\
            modelOptics = "\x\cba\addons\optics\cba_optic_big_pip.p3d";\
        };\
    }

#define PRELOAD\
    class CBA_ScriptedOptic {\
        reticleTexture = "*";\
        reticleTextureNight = "*";\
        bodyTexture = "*";\
        bodyTextureNight = "*";\
    }
