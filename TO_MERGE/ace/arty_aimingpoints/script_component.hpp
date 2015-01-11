#define COMPONENT sys_arty_aimingpoints
#include "\x\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SYS_ARTY_AIMINGPOINTS
	#define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SYS_ARTY_AIMINGPOINTS
	#define DEBUG_SETTINGS DEBUG_SETTINGS_SYS_ARTY_AIMINGPOINTS
#endif

#include "\x\ace\addons\main\script_macros.hpp"
#define MILPREC 17.7777777777778
#define DEG2MIL(deg)	(((deg*MILPREC)) min 6400)
#define MIL2DEG(mil)	mil/MILPREC