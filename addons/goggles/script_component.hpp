#define COMPONENT goggles
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_GOGGLES
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GOGGLES
  #define DEBUG_SETTINGS DEBUG_SETTINGS_GOGGLES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// MACROS
#define GLASSESDEFAULT [false,[false,0,0,0],false]
#define DIRT 0
#define DUST 1
#define BROKEN 2

#define GETDIRT (GVAR(Effects) select DIRT)
#define GETDUST (GVAR(Effects) select DUST)
#define GETBROKEN (GVAR(Effects) select BROKEN)
#define GETDUSTT(type) ((GVAR(Effects) select DUST) select type)

#define SETDUST(type,value) (GVAR(Effects) select DUST) set [type,value]

#define DACTIVE 0
#define DTIME 1
#define DBULLETS 2
#define DAMOUNT 3

#define GLASSDISPLAY (GETUVAR(GVAR(Display),displayNull))

#define CLAMP(x,low,high) (if(x > high)then{high}else{if(x < low)then{low}else{x}})
