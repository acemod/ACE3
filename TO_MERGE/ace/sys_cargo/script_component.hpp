#define COMPONENT sys_cargo
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_sys_cargo
	#define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_sys_cargo
	#define DEBUG_SETTINGS DEBUG_SETTINGS_sys_cargo
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// #define JERRYCAN_M ACE_JerryCan_M_15
#define JERRYCAN_W ACE_JerryCan_Dummy_15
#define JERRYCAN_V ACE_JerryCan_15

#define SPARETYRE_W ACE_Spare_Tyre_Dummy
#define SPARETYRE_V ACE_Spare_Tyre

#define __MAXCARRYVOLUME 0.7
#define __MAXCARRYWEIGHT 30 //20
#define __MAXCARRYWEIGHTBY2 145 //200
#define __MAXDRAGVOLUME 1.5
#define __MAXDRAGWEIGHT 80 //100
#define __MAXPUSHVOLUME 3.2
#define __MAXPUSHWEIGHT 120
#define __MAXLOADVOLUME 1.7 //ccm
#define __MAXLOADWEIGHT 200