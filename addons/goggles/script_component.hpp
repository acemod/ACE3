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
#define GETUNIT ([GVAR(unit),ACE_Player] select (isNull GVAR(unit)))

#define GLASSESDEFAULT [false,[false,0,0,0],false]
#define GETGLASSES(unit) GETVAR(unit,GVAR(condition),GLASSESDEFAULT)
#define SETGLASSES(unit,value) SETVAR(unit,GVAR(condition),value)

#define DIRT 0
#define DUST 1
#define BROKEN 2

#define GETDIRT(unit) (GETGLASSES(unit) select DIRT)
#define GETDUST(unit) (GETGLASSES(unit) select DUST)
#define GETBROKEN(unit) (GETGLASSES(unit) select BROKEN)
#define GETDUSTT(unit,type) ((GETGLASSES(unit) select DUST) select type)

#define SETDUST(unit,type,value) (GETGLASSES(unit) select DUST) set [type,value]

#define DACTIVE 0
#define DTIME 1
#define DBULLETS 2
#define DAMOUNT 3

#define GLASSDISPLAY (GETUVAR(GVAR(Display),displayNull))

#define CLAMP(x,low,high) ((x min high) max low)
