#define COMPONENT trenches
#define COMPONENT_BEAUTIFIED Trenches

#include "\z\ace\addons\main\script_mod.hpp"

//#define DEBUG_MODE_FULL
//#define DISABLE_COMPILE_CACHE
//#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_TRENCHES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_TRENCHES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_TRENCHES
#endif

#define DEFAULT_TEXTURE QPATHTOEF(apl,data\zr_plevel_co.paa)
#define CAMOUFLAGE_DURATION 5
#define CAMOUFLAGE_3DEN_ATTRIBUTE QGVAR(camouflageTrench)
#define IS_TRENCH(OBJ) isArray (configFile >> "CfgVehicles" >> typeOf OBJ >> QGVAR(camouflagePositions))

#include "\z\ace\addons\main\script_macros.hpp"
