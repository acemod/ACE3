#define COMPONENT resting
#include "\z\ace\Addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_RESTING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RESTING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_RESTING
#endif

#include "\z\ace\Addons\main\script_macros.hpp"

#define RESTEDRECOIL 0.6
#define BIPODRECOIL 0.3
#define MAXDISTANCE 1
#define MAXANGLE 15
#define MAXHEIGHT 0.45
#define CAMSHAKE [1,0.5,5]
