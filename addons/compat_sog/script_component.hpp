#define COMPONENT compat_sog
#define COMPONENT_BEAUTIFIED S.O.G. Prairie Fire Compatibility

#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\z\ace\addons\main\script_macros.hpp"

#include "\z\ace\addons\refuel\defines.hpp"

#define EXPLOSIVES_PLACE(CLASS) EGVAR(explosives,DOUBLES(Place,CLASS))
#define QEXPLOSIVES_PLACE(CLASS) QUOTE(EXPLOSIVES_PLACE(CLASS))
