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

#define SCOPE_RECOIL_MIN 0.03
#define SCOPE_RECOIL_MAX 0.032

#define SCOPE_SHIFT_X_MIN 0.04
#define SCOPE_SHIFT_X_MAX 0.05
#define SCOPE_SHIFT_Y_MIN -0.02
#define SCOPE_SHIFT_Y_MAX -0.03

#define RETICLE_SHIFT_X_MIN 0.006
#define RETICLE_SHIFT_X_MAX 0.011
#define RETICLE_SHIFT_Y_MIN -0.009
#define RETICLE_SHIFT_Y_MAX -0.014

#define RECENTER_TIME 0.09
