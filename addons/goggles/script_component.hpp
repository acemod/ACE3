#define COMPONENT goggles
#define COMPONENT_BEAUTIFIED Goggles
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_GOGGLES
  #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GOGGLES
  #define DEBUG_SETTINGS DEBUG_SETTINGS_GOGGLES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// MACROS
#define GLASSESDEFAULT [false,[false,0,0,0],false]
#define GETGLASSES(unit) GETVAR(unit,GVAR(Condition),GLASSESDEFAULT)
#define SETGLASSES(unit,value) SETVAR(unit,GVAR(Condition),value)

#define DIRT 0
#define DUST 1
#define BROKEN 2

#define GETDIRT (GETGLASSES(ace_player) select DIRT)
#define GETDUST (GETGLASSES(ace_player) select DUST)
#define GETBROKEN (GETGLASSES(ace_player) select BROKEN)
#define GETDUSTT(type) ((GETGLASSES(ace_player) select DUST) select type)

#define SETDUST(type,value) (GETGLASSES(ace_player) select DUST) set [type,value]

#define DACTIVE 0
#define DTIME 1
#define DBULLETS 2
#define DAMOUNT 3

#define GLASSDISPLAY GETUVAR(GVAR(Display),displayNull)

#define CLAMP(x,low,high) (if(x > high)then{high}else{if(x < low)then{low}else{x}})
