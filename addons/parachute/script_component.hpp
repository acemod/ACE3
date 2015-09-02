#define DEBUG_ENABLED_PARACHUTE
#define COMPONENT parachute
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_PARACHUTE
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PARACHUTE
  #define DEBUG_SETTINGS DEBUG_SETTINGS_PARACHUTE
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define MACRO_HASRESERVE  ace_hasReserveParachute = 1; \
    ace_reserveParachute = "ACE_ReserveParachute";
